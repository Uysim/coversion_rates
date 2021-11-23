describe ProjectsController do
  let(:app) { ProjectsController.new }

  context "POST to /api/v1/projects" do
    let(:response) { post "/api/v1/projects" }
    it "returns status 200 OK" do 
      expect(response).to be_ok
      expect(json_response).to include({
        "api_key" => be_present
      })
    end
  end
end