require_relative "../login_helper"

feature "FEATURE: Booking space" do
  scenario "user is able to go to the page to book a space" do
    sign_up
    log_in
    Property.create("house", "London", "double", "4", "200", "2019-12-01", "2019-12-07", "Buck House",
                    "2", "TRUE", "TRUE", "TRUE", "TRUE", "NULL", "test_username")
    visit "/"
    click_link "Check Available Dates"
    expect(page).to have_button("Book now")
  end

  scenario "user is able to book a space" do
    sign_up
    log_in
    Property.create("house", "London", "double", "4", "200", "2019-12-01", "2019-12-07", "Buck House",
                    "2", "TRUE", "TRUE", "TRUE", "TRUE", "NULL", "test_username")
    visit "/"
    click_link("Check Available Dates")
    fill_in "trip-start", :with => "2019-12-01"
    fill_in "trip-end", :with => "2019-12-07"
    select "1 guest", :from => "guests-select"
    expect(page).to have_button("Book now")
  end
end
