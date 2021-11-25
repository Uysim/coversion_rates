class BasePolicy
  attr_reader :api_key, :record

  def initialize(api_key, record)
    @api_key = api_key
    @record  = record
  end

  private 

  def project 
    api_key.project
  end
end