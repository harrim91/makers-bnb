class MakersBNB < Sinatra::Base

  get '/requests' do
    if current_user
      @sent_requests = Request.all(user_id: current_user.id)

      user_accommodations = Accommodation.all(user_id: current_user.id)

      @received_requests = []

      user_accommodations.each do |accommodation|
        @received_requests << Accommodation.requests(accommodation.id)
      end

      @received_requests.flatten!
    end

    erb :'requests/index'
  end

  get '/requests/:id' do
    @current_request = Request.get(params[:id])
    erb :'requests/reply'
  end

  put '/requests/:id' do
    current_request = Request.get(params[:id])
    current_request.update( confirmed: params[:confirmed])
    redirect '/requests'
  end

  post '/requests' do
    current_request = Request.create check_in: params[:check_in],
                          check_out: params[:check_out],
                          confirmed: nil,
                            user_id: current_user.id,
                   accommodation_id: params[:accommodation_id]

    if current_request.save
      current_accom = Accommodation.first(id: params[:accommodation_id])
      flash.next[:notice] = "You have requested #{ current_accom.name}
                            from #{ current_request.check_in.strftime "%b %d, %Y" } to
                            #{ current_request.check_out.strftime "%b %d, %Y" }"
      redirect '/'
    else
      redirect back
    end
  end

end







