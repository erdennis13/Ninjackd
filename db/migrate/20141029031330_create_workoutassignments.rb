class CreateWorkoutassignments < ActiveRecord::Migration
  def change
    create_table :workoutassignments do |t|
      t.integer :workout_id
      t.integer :exercise_id
      t.integer :sets
      t.integer :reps

      t.timestamps
    end
  end
end
