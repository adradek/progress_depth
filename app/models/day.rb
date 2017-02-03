class Day < ActiveRecord::Base
  has_many :activities

  validates :day, presence: true
  validates :day, uniqueness: true
end
