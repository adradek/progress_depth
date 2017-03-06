class AddIndexesToActivities < ActiveRecord::Migration
  # def up
  #   execute %{
  #     CREATE INDEX activities_lower_title ON activities (lower(title) varchar_pattern_ops)
  #   }

  #   execute %{
  #     CREATE INDEX activities_lower_description ON activities (lower(description) varchar_pattern_ops)
  #   }
  # end

  # def down
  #   remove_index :activities, name: 'activities_lower_title'
  #   remove_index :activities, name: 'activities_lower_description'
  # end
end
