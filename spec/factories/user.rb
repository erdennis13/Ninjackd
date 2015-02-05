# This will guess the User class
FactoryGirl.define do
  factory :user do
    email "test_user@example.com"
    password "password"
    name "Test"
    username "testuser"
    paypal_payment_token "test_paypal_token"
    admin false
  end

  # This will use the User class (Admin would have been guessed)
  factory :admin, class: User do
    name "Admin"
    email "admin@example.com"
    password "password"
    username "testadmin"
    paypal_payment_token "test_admin_token"
    admin true
  end
end
