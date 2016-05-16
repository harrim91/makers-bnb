class Accommodation
  include DataMapper::Resource

  property :id,     Serial
  property :name,   String, required: true
  property :desc,   String
  property :price,  Integer, required: true

end
