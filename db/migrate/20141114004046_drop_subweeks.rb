class DropSubweeks < ActiveRecord::Migration
  def change
  	drop_table :subweeks
  end
end
