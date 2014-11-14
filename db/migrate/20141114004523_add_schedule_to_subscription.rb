class AddScheduleToSubscription < ActiveRecord::Migration
  def change
    add_column :subscriptions, :schedule, :date
  end
end
