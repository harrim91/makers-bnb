class MakersBNB < Sinatra::Base

  post '/bookings' do
    booking = Booking.create
    p booking
    if booking.save
      redirect '/requests'
    else
      redirect back
    end
  end

  get '/requests' do
    @bookings = Booking.all
  end
end
