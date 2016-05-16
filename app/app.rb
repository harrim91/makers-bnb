ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'dm_setup'

require_relative 'server'

class MakersBNB < Sinatra::Base
  get '/' do
    'Hello MakersBNB!'
  end

end
