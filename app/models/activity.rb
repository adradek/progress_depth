class Activity < ActiveRecord::Base
  belongs_to :day

  validates :title, :day_id, :value, presence: true

  after_save    :recalculate_day!
  after_destroy :recalculate_day!

  private

  def recalculate_day!
    self.day.recalculate!
  end
end
