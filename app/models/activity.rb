# == Schema Information
#
# Table name: activities
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  description :string
#  value       :integer          not null
#  day_id      :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

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
