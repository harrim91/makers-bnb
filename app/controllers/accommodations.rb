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
                              price: params[:price],
                            user_id: current_user.id

    if acc.save
      redirect '/accommodations'
    else
      redirect back
    end
  end
end
