require 'bcrypt'

class User

	include DataMapper::Resource

	attr_reader :password
	attr_accessor :password_confirmation

	property :id, Serial
	property :name, String
	property :username, String, :unique => true, :message => "That username is already taken"
	property :email, String, :unique => true, :message => "That email address is already registered"

	property :password_digest, Text

	has n, :peeps, through: Resource

  def password=(password)
  	@password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  validates_confirmation_of :password

  def self.authenticate(username, password)
	  user = first(:username => username)
	  if user && BCrypt::Password.new(user.password_digest) == password
	    user
	  else
	    nil
	  end
	end

end