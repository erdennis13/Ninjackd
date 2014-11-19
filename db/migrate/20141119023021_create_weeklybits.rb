class CreateWeeklybits < ActiveRecord::Migration
  def change
    create_table :weeklybits do |t|
      t.integer :weeklyplan_id
      t.integer :workout_id
      t.integer :day

      t.timestamps
    end
  end
end
