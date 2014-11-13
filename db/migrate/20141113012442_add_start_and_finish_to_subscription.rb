class AddStartAndFinishToSubscription < ActiveRecord::Migration
  def change
    add_column :subscriptions, :start_time, :datetime
    add_column :subscriptions, :finish_time, :datetime
  end
end
