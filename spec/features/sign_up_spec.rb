describe "FEATURE: Signing up" do
  scenario "user can sign up" do
    expect { sign_up }.to change { User.count }.by(1)
  end

  scenario "user cant sign up with existing email or username" do
    expect(page).to have_content("Username is already taken. Email is already taken.")
  end

  scenario "user cant sign up with non-matching passwords" do
    expect { incorrect_sign_up }.not_to change { User.count }
  end
end
