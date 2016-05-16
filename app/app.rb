ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './app/dm_setup'

require './app/server'
require './app/controllers/accommodations'

class MakersBNB < Sinatra::Base
  get '/' do
    'Hello MakersBNB!'
  end

end
