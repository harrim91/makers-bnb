class MakersBNB < Sinatra::Base

  get '/inventories/:id' do
    headers 'Access-Control-Allow-Origin' => '*'
    inventory = Inventory.all(accommodation_id: params[:id], :date.gte => Time.now)
    inventory.to_json
  end

  post '/inventories' do
    start_date = DateTime.strptime(params[:start_date],"%d/%m/%Y")
    end_date = DateTime.strptime(params[:end_date],"%d/%m/%Y")

    (start_date..end_date).each do |date|
      inventory = Inventory.create(date: date,
                       booked: false,
                       accommodation_id: params[:accommodation_id])
      flash.next[:notice] = 'Inventory sucessfully added' if inventory.save
    end
    redirect back
  end

  put '/inventories' do
    accommodation_inventories = Inventory.all(accommodation_id: params[:accommodation_id])
    inventories = accommodation_inventories.all(:date.gte => params[:check_in], :date.lte => params[:check_out])
    inventories.each do |inventory|
      inventory.update(booked: true)
    end
  end
end
