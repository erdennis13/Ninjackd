class CreateUserreviews < ActiveRecord::Migration
  def change
    create_table :userreviews do |t|
      t.integer :user_id
      t.string :review

      t.timestamps
    end
  end
end
