class BaseController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  
  private 

  def authenticate!
    @current_project = Project.find_by(api_key: request.env["HTTP_AUTHORIZATION"])
    halt 401, "Unauthorized" unless @current_project
  end
end