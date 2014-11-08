class AddCompleteToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :complete, :boolean
  end
end
