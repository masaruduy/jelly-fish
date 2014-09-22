class AdsController < ApplicationController
  before_action :set_ad, only: [:show, :edit, :update, :destroy]

  # GET /ads
  def index
    if current_user.indian || current_user.admin
      @ads = Ad.where("repost_time < ?",1.day.from_now).page(params[:page])
    else
      @ads = Ad.where(user: current_user).page(params[:page])
    end
  end

  def done
    ad = Ad.find(params[:id])
    ad.repost_time += 1.day
    ad.last_repost = Time.now
    ad.save
    redirect_to action: :index
  end

  # GET /ads/1
  def show
  end

  # GET /ads/new
  def new
    redirect_to action: :index if Ad.where(user: current_user).size >= 5
    @ad = Ad.new
    @ad.user = current_user
  end

  # GET /ads/1/edit
  def edit
  end

  # POST /ads
  def create
    @ad = Ad.new(ad_params)
    @ad.user_id = current_user.id
    @ad.done = false

    if @ad.save
      redirect_to action: :index
    else
      render :new
    end
  end

  # PATCH/PUT /ads/1
  def update
    old_ad_link = @ad.link
    if @ad.update(ad_params)
      mail_update(old_ad_link, @ad)
      redirect_to action: :index, notice: 'Ad was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /ads/1
  def destroy
    @ad.destroy
    redirect_to ads_url, notice: 'Ad was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ad
      @ad = Ad.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ad_params
      params.require(:announce).permit(:link, :repost_time)
    end

    def mail_update(old_ad_link, ad)
      if old_ad_link == ad.link
        TaskMailer.modify_task(ad)
      else
        TaskMailer.replace_task(old_ad_link, ad)
      end.deliver
    end
end
