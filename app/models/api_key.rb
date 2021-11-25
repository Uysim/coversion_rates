require 'securerandom'

class ApiKey < ApplicationRecord
  belongs_to :project
  before_create :generate_token!, if: ->{  token.blank? }

  def generate_token!
    begin
      self.token = SecureRandom.hex
    end while self.class.exists?(token: token)
  end
end