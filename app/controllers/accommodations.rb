class MakersBNB < Sinatra::Base


  get '/accommodations/new' do
    erb :'accommodations/new'
  end

  get '/accommodations/:id' do
    @accommodation = Accommodation.first(id: params[:id])
    erb :'accommodations/index'
  end

  post '/accommodations' do
    accommodation = Accommodation.create name: params[:name],
                                         desc: params[:desc],
                                        price: params[:price],
                                      user_id: current_user.id

    accommodation.save ? redirect("accommodations/#{Accommodation.last.id}") : redirect(back)

  end

end
