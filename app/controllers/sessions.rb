class MakersBNB < Sinatra::Base

  post '/sessions' do
    user = User.authenticate params[:email], params[:password]

    if user
      session[:user_id] = user.id
    else
      flash.next[:errors] = ['Incorrect login details']
    end

    redirect back
  end
end
