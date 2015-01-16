module Features
  def sign_in
    user = new_user(attributes)
    user.save!
    
    visit new_user_session_path
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_button "Log in"
  end

  def sign_out
    sign_in

    click_on "Log out"
  end

  def new_user(attributes)
    User.new(attributes)
  end

  def attributes
    {name: "User", username: "Username", admin: false, paypal_payment_token: "Test", 
      email: "user@example.com", password: "password"}
  end
end