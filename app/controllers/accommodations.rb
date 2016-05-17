class MakersBNB < Sinatra::Base

  get '/accommodations' do
    @accommodations = Accommodation.all
    erb :'accommodations/index'
  end

  get '/accommodations/new' do
    erb :'accommodations/new'
  end

  post '/accommodations' do
    acc = Accommodation.create name: params[:name],
                        desc: params[:desc],
                        price: params[:price]
    if acc.save
      redirect '/accommodations'
    else
      redirect back
    end
  end

  get '/accommodations/:id' do
    @acc = Accommodation.first(id: params[:id])
    p @acc
    erb :'accommodations/info'
  end
end
