class AddPayPalCustomerTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :paypal_customer_token, :string
    add_column :users, :paypal_recurring_profile, :string
  end
end
