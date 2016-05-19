class MakersBNB < Sinatra::Base

  get '/inventories/:id' do
    headers 'Access-Control-Allow-Origin' => '*'
    inventory = Inventory.all(accommodation_id: params[:id])
    inventory.to_json
  end

  post '/inventories' do
    start_date = DateTime.strptime(params[:start_date],"%d/%m/%Y")
    end_date = DateTime.strptime(params[:end_date],"%d/%m/%Y")
    if end_date < start_date
      flash.next[:errors] = ['You can\'t add an end date prior to your start date']
      redirect back
    end
    (start_date..end_date).each do |date|
      Inventory.create(date: date,
                       booked: false,
                       accommodation_id: params[:accommodation_id])
    end
    flash.next[:notice] = 'Inventory sucessfully added'
    redirect back
  end
end
