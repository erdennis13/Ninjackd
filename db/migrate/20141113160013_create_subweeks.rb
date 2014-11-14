class CreateSubweeks < ActiveRecord::Migration
  def change
    create_table :subweeks do |t|
      t.datetime :subdate
      t.integer :subscription_id

      t.timestamps
    end
  end
end
