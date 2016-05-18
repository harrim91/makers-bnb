class MakersBNB < Sinatra::Base

  post '/inventories' do
    (params[:start_date]..params[:end_date]).each do |date|
      Inventory.create(date: date,booked: nil, accommodation_id: params[:accommodation_id])
    end
  end
end
