class AddNotesToWorkouts < ActiveRecord::Migration
  def change
    add_column :workouts, :note, :text
  end
end
