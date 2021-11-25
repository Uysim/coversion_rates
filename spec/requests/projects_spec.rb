describe ProjectsController do
  let(:app) { ProjectsController.new }

  context "POST to /api/v1/projects" do
    let(:response) { post "/api/v1/projects" }
    it "creates project with api_key" do 
      expect(response).to be_ok
      expect(json_response).to include({
        "api_key" => be_present
      })
    end
  end

  context "DELETE to /api/v1/projects/:id" do
    let(:project) { Project.create! }

    it "deletes project successfully" do
      response = delete "/api/v1/projects/#{project.id}",  nil, { "HTTP_AUTHORIZATION" => project.api_key }
      expect(response).to be_ok
      expect(Project.find_by(id: project.id)).to be_blank
    end

    it "deletes project fail with other poject key" do 
      other_project = Project.create!
      response = delete "/api/v1/projects/#{project.id}",  nil, { "HTTP_AUTHORIZATION" => other_project.api_key }
      expect(response.status).to eq(403)
    end
  end
end