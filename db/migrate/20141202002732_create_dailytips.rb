class CreateDailytips < ActiveRecord::Migration
  def change
    create_table :dailytips do |t|
      t.string :tip

      t.timestamps
    end
  end
end