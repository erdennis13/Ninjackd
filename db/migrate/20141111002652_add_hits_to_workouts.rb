class AddHitsToWorkouts < ActiveRecord::Migration
  def change
    add_column :workouts, :hits, :integer
  end
end
