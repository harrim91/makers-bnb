class MakersBNB < Sinatra::Base

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(name: params[:name],
                        email: params[:email],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])

    if @user.save
      session[:user_id] = @user.id
      redirect '/'
    else
      flash.next[:errors] = @user.errors.full_messages
      session[:name] = params[:name]
      session[:email] = params[:email]
      redirect back
    end
  end
end
