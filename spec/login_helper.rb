def log_in
  visit '/login'
  fill_in 'username', :with => 'test_username'
  fill_in 'password', :with => 'test_password'
  find('input[type="submit"]').click
end

def sign_up
  visit '/signup'
  fill_in 'username', :with => 'test_username'
  fill_in 'password', :with => 'test_password'
  fill_in 'email', :with => 'test@test.com'
  fill_in 'phone', :with => '01234567890'
  find('input[type="submit"]').click
end
