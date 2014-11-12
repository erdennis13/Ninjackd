class AddWeightfacilityToWorkouts < ActiveRecord::Migration
  def change
    add_column :workouts, :weightFacility, :string
  end
end
