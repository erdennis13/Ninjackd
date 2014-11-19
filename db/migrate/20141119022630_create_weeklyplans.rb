class CreateWeeklyplans < ActiveRecord::Migration
  def change
    create_table :weeklyplans do |t|
      t.string :name

      t.timestamps
    end
  end
end
