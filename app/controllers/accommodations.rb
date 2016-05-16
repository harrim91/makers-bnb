class MakersBNB < Sinatra::Base

  get '/accommodations' do
    @accommodations = Accommodation.all
    erb :'accommodations/index'
  end

  get '/accommodations/new' do
    erb :'accommodations/new'
  end

  post '/accommodations' do
    Accommodation.create name: params[:name],
                        desc: params[:desc],
                        price: params[:price]
    redirect '/accommodations'
  end
end
