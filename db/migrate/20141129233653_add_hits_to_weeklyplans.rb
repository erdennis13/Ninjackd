class AddHitsToWeeklyplans < ActiveRecord::Migration
  def change
    add_column :weeklyplans, :hits, :integer, default: 0
  end
end
