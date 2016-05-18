class MakersBNB < Sinatra::Base

  post '/inventories' do
    start_date = DateTime.strptime(params[:start_date],"%d/%m/%Y")
    end_date = DateTime.strptime(params[:end_date],"%d/%m/%Y")
    (start_date..end_date).each do |date|
      Inventory.create(date: date,
                       booked: nil,
                       accommodation_id: params[:accommodation_id])
    end
    flash.next[:notice] = 'Inventory sucessfully added'
    redirect back
  end
end
