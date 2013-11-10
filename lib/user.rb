require 'bcrypt'

class User

	include DataMapper::Resource

	attr_reader :password
	attr_accessor :password_confirmation

	property :id, Serial
	property :name, String
	property :username, String, :unique => true#, :message => "That username is already taken"
	property :email, String, :unique => true#, ;message => "That email address is alreay registered"

	property :password_digest, Text

  def password=(password)
  	@password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  validates_confirmation_of :password

end