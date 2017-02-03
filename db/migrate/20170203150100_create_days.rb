class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.date    :day,     null: false
      t.integer :balance, null: false, default: 0
      t.timestamps null: false
    end

    add_index :days, :day, unique: true
  end
end
