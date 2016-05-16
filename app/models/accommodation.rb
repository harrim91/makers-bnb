class Accommodation
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :desc, String
  property :price, Float

end
