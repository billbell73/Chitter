require 'data_mapper'
require 'user'

describe User do

	let(:user) { User.new } 
	 
	it 'is a datamapper resource' do
	 	expect(User.included_modules).to include DataMapper::Resource
	end

	it 'has an id' do
		expect(user).to respond_to :id
	end

	it 'has a name' do
		expect(user).to respond_to :name
	end

	it 'has a username' do
		expect(user).to respond_to :username
	end

	it 'has an email' do
		expect(user).to respond_to :email
	end

	it 'validates password' do
		expect(user).to respond_to :password
	end


end