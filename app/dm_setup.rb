require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'
require 'bcrypt'

require './app/models/user'
require './app/models/accommodation'
require './app/models/inventory'
require './app/models/request'


DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/makers_bnb_#{ENV['RACK_ENV']}")
DataMapper.finalize
