ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require './app/dm_setup'

require './app/server'
require './app/controllers/sessions'
require './app/controllers/users'
require './app/controllers/accommodations'
require './app/controllers/inventory'
require './app/controllers/requests'
