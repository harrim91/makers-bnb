ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'dm_setup'


require_relative 'server'
require_relative 'controllers/users'
