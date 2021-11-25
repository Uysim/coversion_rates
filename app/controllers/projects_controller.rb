class ProjectsController < BaseController

  post '/api/v1/projects' do
    @project = Project.create!
    @project.to_json
  end

  delete '/api/v1/projects/:id' do
    authenticate!
    @project = Project.find(params[:id])
    authorize @project, :delete?
    @project.destroy!
    status 200
  end
end