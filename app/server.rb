class MakersBNB < Sinatra::Base

  enable :sessions
  # register Sinatra::partial

  # enable :partial_underscores

  get '/' do
    erb :index
  end

  helpers do
    def current_user
      @current_user = User.get(session[:user_id])
    end
  end
end
