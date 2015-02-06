module Features
  def sign_user_in
    visit root_path

    user = create(:user)
    fill_in "navbar_email", with: user.email
    fill_in "navbar_password", with: user.password
    click_button "navbar_signin"

  end

  def sign_user_out
    sign_user_in

    click_on "Log out"
  end

  def sign_admin_in
    visit root_path

    admin = create(:admin)
    fill_in "navbar_email", with: admin.email
    fill_in "navbar_password", with: admin.password
    click_button "navbar_signin"

  end

end