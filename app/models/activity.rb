class Activity < ActiveRecord::Base
  belongs_to :day

  validates :title, :day_id, :value, presence: true
end
