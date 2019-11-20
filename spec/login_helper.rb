def log_in
  visit '/login'
  fill_in 'username', :with => 'test_username'
  fill_in 'password', :with => 'test_password'
  find('input[type="submit"]').click
end

def sign_up(username: 'test_username', password: 'test_password', confirmpassword: 'test_password', email: 'test@test.com', phone: '01234567890')
  visit '/signup'
  fill_in 'username', :with => username
  fill_in 'password', :with => password
  fill_in 'confirm-password', :with => confirmpassword
  fill_in 'email', :with => email
  fill_in 'phone', :with => phone
  find('input[type="submit"]').click
end
