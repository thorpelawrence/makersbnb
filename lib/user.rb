require_relative '../database'
require 'bcrypt'

class User
  def self.create(username, password, email, phone_no)
    connection = Database.connect
    connection.exec_params("INSERT INTO users (username, pass, email, phone_number) VALUES ($1, $2, $3, $4)",
      [username, BCrypt::Password.create(password), email, phone_no])
  end

  def self.get_by_username(username)
    connection = Database.connect
    user = connection.exec_params("SELECT * FROM users WHERE username=$1", [username]).first
  end
  
  def self.check_password(username, password)
    connection = Database.connect
    user = connection.exec_params("SELECT * FROM users WHERE username=$1", [username]).first
    return BCrypt::Password.new(user['password']) == password
  end
end
