class AddActiveToWorkouts < ActiveRecord::Migration
  def change
    add_column :workouts, :active, :boolean, default: true
  end
end
