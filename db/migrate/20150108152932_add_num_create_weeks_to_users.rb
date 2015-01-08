class AddNumCreateWeeksToUsers < ActiveRecord::Migration
  def change
    add_column :users, :numweeks, :integer, default: 0
  end
end
