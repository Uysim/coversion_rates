class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  get '/' do
    "Hello, world!"
  end
end