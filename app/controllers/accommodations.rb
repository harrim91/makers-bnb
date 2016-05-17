class MakersBNB < Sinatra::Base

  get '/accommodations' do
    @accommodations = Accommodation.all
    erb :'accommodations/index'
  end

  get '/accommodations/new' do
    erb :'accommodations/new'
  end

  post '/accommodations' do
    accommodation = Accommodation.create name: params[:name],
                        desc: params[:desc],
                        price: params[:price]
    if accommodation.save
      redirect '/accommodations'
    else
      redirect back
    end
  end

  get '/accommodations/:id' do
    @current_accommodation = Accommodation.first(id: params[:id])
    erb :'accommodations/info'
  end
end
