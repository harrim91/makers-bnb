class MakersBNB < Sinatra::Base

  get '/requests' do
    if current_user
      get_sent_requests
      get_received_requests
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
    new_request = Request.create check_in: params[:check_in],
                          check_out: params[:check_out],
                          confirmed: nil,
                            user_id: current_user.id,
                   accommodation_id: params[:accommodation_id]

    if new_request.save
      current_accom = Accommodation.first(id: params[:accommodation_id])
      flash.next[:notice] = "You have requested #{ current_accom.name}
                            from #{ new_request.check_in.strftime "%b %d, %Y" } to
                            #{ new_request.check_out.strftime "%b %d, %Y" }"
      redirect '/'
    else
      redirect back
    end
  end

  helpers do
    def get_sent_requests
      @sent_requests = Request.all(user_id: current_user.id)
    end

    def get_received_requests
      @received_requests = []
      current_user.accommodations.each do |accommodation|
        @received_requests << Accommodation.requests(accommodation.id)
      end
      @received_requests.flatten!
    end
  end

end







