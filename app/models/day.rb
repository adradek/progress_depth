class Day < ActiveRecord::Base
  validates :day, presence: true
  validates :day, uniqueness: true
end
