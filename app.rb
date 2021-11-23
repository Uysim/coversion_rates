require 'sinatra'
require "sinatra/activerecord"

set :database_file, "config/database.yml"

class ConversionRatesApp < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  get '/' do
    "Hello, world!"
  end
end