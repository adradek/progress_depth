class Day < ActiveRecord::Base
  has_many :activities

  validates :day, presence: true
  validates :day, uniqueness: true

  before_destroy :delete_activities!

  def recalculate!
    self.balance = activities.sum(:value)
    save!
  end

  def to_s
    day.strftime('%d.%m.%Y')
  end

  # Free of fines days are saturday and sunday
  def free?
    day.wday.in? [6, 7]
  end

  private

  def delete_activities!
    Activity.where(day_id: id).delete_all
  end
end
