class RemoveHitsFromWorkouts < ActiveRecord::Migration
  def change
  	remove_column :workouts, :hits
  end
end
