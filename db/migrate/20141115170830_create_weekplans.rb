class CreateWeekplans < ActiveRecord::Migration
  def change
    create_table :weekplans do |t|
      t.string :name
      t.integer :sunday_workout_id
      t.integer :monday_workout_id
      t.integer :tuesday_workout_id
      t.integer :wednesday_workout_id
      t.integer :thursday_workout_id
      t.integer :friday_workout_id
      t.integer :saturday_workout_id

      t.timestamps
    end
  end
end
