module Response
  module JsonHelpers
    def json_response
      @json_response ||= JSON.parse(response.body)
    end
  end
end

RSpec.configure do |config|
  config.include Response::JsonHelpers
end
