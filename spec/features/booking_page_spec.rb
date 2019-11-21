require_relative "../login_helper"

feature "FEATURE: Booking space" do
  scenario "user is able to go to the page to book a space" do
    sign_up
    log_in
    visit "/profile"
    click_link("Bramleys End")
    expect(page).to have_link("Bramleys End")
  end

  scenario "user is able to book a space" do
    sign_up
    log_in
    visit "/profile"
    click_link("Bramleys End")
    fill_in "trip-start", :with => "2019-12-01"
    fill_in "trip-end", :with => "2019-12-14"
    select "1 guest", :from => "guests-select"
    expect(page).to have_button("Book now")
  end
end
