class ProjectsController < BaseController

  post '/api/v1/projects' do
    @project = Project.create!
    @project.to_json
  end
end