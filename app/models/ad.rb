class Ad < ActiveRecord::Base
  belongs_to :user
  before_save :add_a_day 
  after_create :send_email_on_create
  before_destroy :send_email_on_destroy

  private

  def add_a_day
    self.repost_time += 1.day if self.repost_time < 24.hours.from_now
  end

  def send_email_on_create
    TaskMailer.new_task(self).deliver
  end
  
  def send_email_on_destroy
    TaskMailer.drop_task(self).deliver
  end

end
