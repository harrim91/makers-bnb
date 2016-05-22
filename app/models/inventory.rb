class Inventory
  include DataMapper::Resource

  property :id, Serial
  property :date, Date, unique_index: :accommodation_date
  property :booked, Boolean, unique_index: :accommodation_date

  belongs_to :accommodation
  validates_uniqueness_of :date, scope: :accommodation

end
