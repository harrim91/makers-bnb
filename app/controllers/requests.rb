class MakersBNB < Sinatra::Base
  post '/request' do
    request = Request.create check_in: params[:check_in],
                          check_out: params[:check_out],
                          confirmed: false,
                            user_id: current_user.id,
                   accommodation_id: params[:accommodation_id]

    if request.save
     redirect '/accommodations'
    else
     redirect back
    end
  end
end
