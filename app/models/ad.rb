class Ad < ActiveRecord::Base
  belongs_to :user
  before_save :add_a_day 

  private

  def add_a_day
    self.repost_time += 1.day if self.repost_time < 24.hours.from_now
  end

end
