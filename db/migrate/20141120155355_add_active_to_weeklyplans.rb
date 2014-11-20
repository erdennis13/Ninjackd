class AddActiveToWeeklyplans < ActiveRecord::Migration
  def change
    add_column :weeklyplans, :active, :boolean, default: true
  end
end
