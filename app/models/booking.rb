class Booking
  include DataMapper::Resource

  property :id, Serial
  property :accom_id, Integer
  property :date, Date
  property :booked?, Boolean
end
