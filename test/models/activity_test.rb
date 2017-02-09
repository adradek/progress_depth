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

require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
