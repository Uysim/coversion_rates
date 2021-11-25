class ApiKeysController < BaseController
  post '/api/v1/api_keys' do
    @api_key = current_project.api_keys.create!
    @api_key.to_json
  end

  delete '/api/v1/api_keys/current' do
    current_api_key.destroy!
    status 200
  end

  post '/api/v1/api_keys/current/reload' do
    current_api_key.generate_token!
    current_api_key.save
    current_api_key.to_json
  end
end