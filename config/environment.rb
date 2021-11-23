ENV['SINATRA_ENV'] ||= "development"
ENV['RACK_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

set :database_file, './database.yml'

APP_ROOT = File.expand_path('..', __dir__)
puts File.join(APP_ROOT, 'app', '**', '*.rb')
Dir.glob(File.join(APP_ROOT, 'app', '**', '*.rb')).each { |file| puts file }
Dir.glob(File.join(APP_ROOT, 'app', '**', '*.rb')).each { |file| require file }