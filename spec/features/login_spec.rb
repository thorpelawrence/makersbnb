require_relative "../login_helper"

feature "log in" do
  scenario "should show logged in" do
    sign_up
    log_in
    expect(page).to have_content("test_username")
  end
end

feature "log out" do
  scenario "should show logged out" do
    sign_up
    log_in
    click_on "Log Out"
    expect(page).to have_content("Login")
  end
end