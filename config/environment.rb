ENV['RACK_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['RACK_ENV'])

set :database_file, './database.yml'
set :default_content_type, :json
APP_ROOT = File.expand_path('..', __dir__)

Dir.glob(File.join(APP_ROOT, 'app', 'models', '*.rb')).each { |file| require file }
Dir.glob(File.join(APP_ROOT, 'app', 'services', '*.rb')).each { |file| require file }
Dir.glob(File.join(APP_ROOT, 'config', 'initializers', '*.rb')).each { |file| require file }
Dir.glob(File.join(APP_ROOT, 'app', 'controllers', '*.rb')).each { |file| require file }
