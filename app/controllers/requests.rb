class MakersBNB < Sinatra::Base

  get '/requests' do
    @sent_requests = Request.all(user_id: current_user.id)

    user_accommodations = Accommodation.all(user_id: current_user.id)

    @received_requests = []
    user_accommodations.each do |accommodation|
      @received_requests << Accommodation.requests(accommodation.id)
    end
    @received_requests.flatten!

    erb :'requests/index'
  end

  get '/requests/:id' do
    @request = Request.first(id: params[:id])
    erb :'requests/reply'
  end

  put '/requests/:id' do
    request = Request.get(id: params[:id])
    request.update( confirmed: params[:confirmed])
    redirect '/requests'
  end

  post '/requests' do
    request = Request.create check_in: params[:check_in],
                          check_out: params[:check_out],
                          confirmed: nil,
                            user_id: current_user.id,
                   accommodation_id: params[:accommodation_id]

    if request.save
      current_accom = Accommodation.first(id: params[:accommodation_id])
      flash.next[:notice] = "You have requested #{ current_accom.name}
                            from #{ request.check_in.strftime "%b %d, %Y" } to
                            #{ request.check_out.strftime "%b %d, %Y" }"
      redirect '/'
    else
     redirect back
    end
  end
end
