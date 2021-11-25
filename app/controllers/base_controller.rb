require "pundit"

class BaseController < Sinatra::Base
  include Pundit

  register Sinatra::ActiveRecordExtension

  error Pundit::NotAuthorizedError do
    status 403
    body "Forbidden"
  end
  
  private

  def pundit_user
    current_project
  end

  def current_project
    @current_project ||= Project.find_by(api_key: request.env["HTTP_AUTHORIZATION"])
  end

  def authenticate!
    halt 401, "Unauthorized" unless current_project
  end
end