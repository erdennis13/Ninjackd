class CreateWarmworks < ActiveRecord::Migration
  def change
    create_table :warmworks do |t|
      t.integer :warmup_id
      t.integer :workout_id

      t.timestamps
    end
  end
end
