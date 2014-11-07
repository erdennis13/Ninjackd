class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.integer :subscription_id
      t.integer :exercise_id
      t.boolean :complete

      t.timestamps
    end
  end
end
