class AddDefaultValueToComplete < ActiveRecord::Migration
  def change
  	change_column :subscriptions, :complete, :boolean, :default => false
  end
end
