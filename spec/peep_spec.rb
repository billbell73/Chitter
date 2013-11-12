require 'data_mapper'
require 'model-domain/peep'

describe Peep do 

	let(:peep) { Peep.new }
	
	it 'is a datamapper resource' do
		expect(Peep.included_modules).to include DataMapper::Resource
	end

	it 'has an id' do
		expect(peep).to respond_to :id
	end

	it 'can set \'content\'' do
		expect(peep).to respond_to :content=
	end

	it 'has \'content\'' do
		expect(peep).to respond_to :content
	end

	it 'can set time posted' do
		expect(peep).to respond_to :created_at=
	end

	it 'knows when it was posted' do
		expect(peep).to respond_to :created_at
	end

	it 'belongs to a user' do
		expect(peep).to respond_to :user
	end

	it 'can set one child peep' do
		expect(peep).to respond_to :peep=
	end

	it 'knows its child peep' do
		expect(peep).to respond_to :peep
	end

	it 'can set a parent peep' do
		expect(peep).to respond_to :parent_peep=
	end 	

	it 'knows its parent peep' do
		expect(peep).to respond_to :parent_peep
	end
	
end