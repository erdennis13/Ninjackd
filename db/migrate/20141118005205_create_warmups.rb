class CreateWarmups < ActiveRecord::Migration
  def change
    create_table :warmups do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
