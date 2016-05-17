class MakersBNB < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  register Sinatra::Partial
  set :static, true
  set :partial_template_engine, :erb

  enable :partial_underscores

  get '/' do
    erb :index
  end

  helpers do
    def current_user
      @current_user = User.get(session[:user_id])
    end
  end

end