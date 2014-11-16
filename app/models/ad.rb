class Ad < ActiveRecord::Base
  belongs_to :user
  before_save :add_days
  after_create :send_email_on_create
  before_destroy :send_email_on_destroy

  attr_accessor :no_days_add

  private

  def add_days
    while self.repost_time < 24.hours.from_now && !no_days_add
      self.repost_time += 1.day 
    end
  end

  def send_email_on_create
    TaskMailer.new_task(self).deliver
  end
  
  def send_email_on_destroy
    TaskMailer.drop_task(self).deliver
  end

end
