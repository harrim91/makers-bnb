ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'dm_setup'
## require 'sinatra/partial'

require_relative 'server'
require_relative 'controllers/users'
