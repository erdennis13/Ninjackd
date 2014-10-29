class DropWorkoutAssignmentTable < ActiveRecord::Migration
  def up
    drop_table :workoutassignments
  end

  def down
    create_table :workoutassignments
  end
end
