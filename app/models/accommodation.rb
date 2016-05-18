class Accommodation
  include DataMapper::Resource
  # attr_reader :name, :desc, :price

  property :id,     Serial
  property :name,   String, required: true
  property :desc,   String, length: 500
  property :price,  Integer, required: true, min: 1

  belongs_to :user
  has n, :inventories

end
