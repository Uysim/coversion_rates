module Response
  module JsonHelpers
    def json_response
      @json_response ||= JSON.parse(response.body)
    end

    def last_json_response
      JSON.parse(last_response.body)
    end
  end
end

RSpec.configure do |config|
  config.include Response::JsonHelpers
end
