class Request
  include DataMapper::Resource

  property :id, Serial
  property :check_in , Date
  property :check_out, Date
  property :confirmed, Boolean

  belongs_to :user
  belongs_to :accommodation
end
