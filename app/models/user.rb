class User

  include DataMapper::Resource

  property :id,                 Serial
  property :name,               String
  property :email,              String, format: :email_address, required: true, unique: true
  property :password_digest,    String, length: 80

  has n, :accommodations, :requests
  validates_confirmation_of :password

  attr_reader :password
  attr_accessor :password_confirmation

  def password= password
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = User.first(email: email)

    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

end
