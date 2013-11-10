require 'data_mapper'
require 'peep'

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
	
end