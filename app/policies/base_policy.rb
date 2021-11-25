class BasePolicy
  attr_reader :project, :record

  def initialize(project, record)
    @project = project
    @record  = record
  end
end