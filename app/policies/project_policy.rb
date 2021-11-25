class ProjectPolicy < BasePolicy
  def delete?
    record == project
  end
end