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
    current_api_key
  end

  def current_api_key
    @current_api_key ||= ApiKey.find_by(token: request.env["HTTP_AUTHORIZATION"])
  end

  def current_project
    current_api_key.project if current_api_key.present?
  end

  def authenticate!
    halt 401, "Unauthorized" unless current_project.present?
  end
end