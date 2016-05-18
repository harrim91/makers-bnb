class MakersBNB < Sinatra::Base

  post '/inventories' do
    accommodation = Accommodation.last
    p accommodation
    if accommodation.name == params[:name]
      (params[:startdate]..params[:enddate]).each do |date|
        Inventory.create(date: date,booked: false, accom_id: accommodation.id)
      end
    end
  end

  get '/requests' do
    @inventories = Inventory.all
  end
end
