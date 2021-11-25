describe ProjectsController do
  let(:app) { ProjectsController.new }

  context "POST to /api/v1/projects" do
    let(:response) { post "/api/v1/projects" }
    it "creates project with api_key" do 
      expect(response).to be_ok
      expect(json_response).to include({
        "api_keys" => [a_hash_including({
          "token" => be_present
        })]
      })
    end
  end

  context "DELETE to /api/v1/projects/:id" do
    let(:project) { Project.create! }

    it "deletes project successfully" do
      api_key = project.api_keys.first
      response = delete "/api/v1/projects/#{project.id}",  nil, { "HTTP_AUTHORIZATION" => api_key.token }
      expect(response).to be_ok
      expect(Project.find_by(id: project.id)).to be_blank
    end

    it "deletes project fail with other poject key" do 
      other_project = Project.create!
      other_api_key = other_project.api_keys.first
      response = delete "/api/v1/projects/#{project.id}",  nil, { "HTTP_AUTHORIZATION" => other_api_key.token }
      expect(response.status).to eq(403)
    end
  end
end