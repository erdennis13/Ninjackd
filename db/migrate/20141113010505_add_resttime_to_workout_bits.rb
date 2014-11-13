class AddResttimeToWorkoutBits < ActiveRecord::Migration
  def change
    add_column :workoutbits, :restime, :integer
  end
end
