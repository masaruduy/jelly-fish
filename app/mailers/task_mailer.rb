class TaskMailer < ActionMailer::Base
  default from: "admin@jelly-fish.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.task.new.subject
  #
  def new_task(ad)
    @ad = ad
    mail to: indian_email, subject: "[JellyFish] New repost task"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.task.drop.subject
  #
  def drop_task(ad)
    @ad = ad
    mail to: indian_email, subject: "[JellyFish] Drop repost task"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.task.replace.subject
  #
  def replace_task(old_ad_link, ad)
    @ad = ad
    @old_ad_link = old_ad_link
    mail to: indian_email, subject: "[JellyFish] Replace repost task"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.task.modify.subject
  #
  def modify_task(ad)
    @ad = ad
    mail to: indian_email, subject: "[JellyFish] Modify repost task"
  end

  private

  def indian_email
    User.where(indian: true).map {|u| u.email}
  end
end
