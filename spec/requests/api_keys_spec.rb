describe ApiKeysController do
  let(:app) { ApiKeysController.new }
  let(:project){ Project.create! }
  let(:api_key){ project.api_keys.first }
  
  context "POST /api/v1/api_keys" do
    let(:response) { post "/api/v1/api_keys", nil, { "HTTP_AUTHORIZATION" => api_key.token }  }

    it "creates api_key successfully" do
      expect(response).to be_ok
      expect(json_response).to include({
        "token" => be_present
      })
      expect(project.api_keys.count).to eq(2)
    end
  end

  context "DELETE /api/v1/api_keys/current" do 
    let(:new_api_key) { project.api_keys.create! }
    let(:response) { delete "/api/v1/api_keys/current", nil, { "HTTP_AUTHORIZATION" => new_api_key.token } }

    it "deletes api key successfully" do
      expect(response).to be_ok
      expect(ApiKey.find_by(id: new_api_key.id)).to be_blank
    end
  end

  context "POST /api/v1/api_keys/current/reload" do
    let(:new_api_key) { project.api_keys.create! }
    let(:response) { post "/api/v1/api_keys/current/reload", nil, { "HTTP_AUTHORIZATION" => new_api_key.token } }
    
    it "deletes api key successfully" do
      last_token = new_api_key.token
      expect(response).to be_ok
      expect(new_api_key.reload.token).not_to eq(last_token)
      expect(json_response).to include({ "token" => be_present })
    end
  end
end