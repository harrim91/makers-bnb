class Inventory
  include DataMapper::Resource

  property :id, Serial
  property :date, Date
  property :booked, Boolean

  belongs_to :accommodation

end
