class MakersBNB < Sinatra::Base
  use Rack::MethodOverride
  register Sinatra::Flash
  register Sinatra::Partial
  set :static, true
  set :partial_template_engine, :erb

  enable :sessions
  enable :partial_underscores

  get '/' do
    redirect '/accommodations'
  end

  helpers do
    def current_user
      User.get(session[:user_id])
    end
  end

end
