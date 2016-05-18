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
                                        price: params[:price],
                                      user_id: current_user.id

    accommodation.save ? redirect('/accommodations') : redirect(back)

  end

  get '/accommodations/:id' do
    @current_accommodation = Accommodation.first(id: params[:id])
    erb :'accommodations/info'
  end
end
