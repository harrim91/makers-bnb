class MakersBNB < Sinatra::Base

  enable :sessions
  get '/' do
    'Hello MakersBNB!'
  end

end
