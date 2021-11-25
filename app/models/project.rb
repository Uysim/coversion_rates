class Project < ApplicationRecord
  has_many :api_keys, dependent: :destroy
  after_create :create_api_key!

  private 

  def create_api_key!
    ApiKey.create!(project: self)
  end
end
