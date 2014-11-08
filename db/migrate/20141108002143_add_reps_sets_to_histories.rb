class AddRepsSetsToHistories < ActiveRecord::Migration
  def change
    add_column :histories, :reps, :integer
    add_column :histories, :sets, :integer
  end
end
