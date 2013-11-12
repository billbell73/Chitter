class Peep

	include DataMapper::Resource

	property :id, Serial
	property :content, String
	property :created_at, DateTime

	has 1, :user, :through => Resource
	has 1, :peep, :through => Resource

  property :parent_peep, Object

end