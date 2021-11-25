describe ExchangeRatesController do
  let(:app) { ExchangeRatesController.new }
  let(:project){ Project.create! }
  let(:api_key){ project.api_keys.first }

  context "GET to /api/v1/exchange_rate" do
    it "responses with default exchange_rate" do 
      Money.add_rate("EUR", "USD", 0.3)
      
      get "/api/v1/exchange_rate", nil, { "HTTP_AUTHORIZATION" => api_key.token }

      expect(last_response).to be_ok
      expect(last_json_response).to include({
        "from" => "EUR",
        "to" => "USD",
        "rate" => 0.3
      })
    end
    
    it "responses with exchange_rate from USD to EUR" do 
      Money.add_rate("USD", "EUR", 0.5)

      get "/api/v1/exchange_rate?from=USD&to=EUR", nil, { "HTTP_AUTHORIZATION" => api_key.token }

      expect(last_response).to be_ok
      expect(last_json_response).to include({
        "from" => "USD",
        "to" => "EUR",
        "rate" => 0.5
      })
    end

    it "responses with exchange_rate from EUR to USD" do 
      Money.add_rate("EUR", "USD", 0.6)

      get "/api/v1/exchange_rate?from=EUR&to=USD", nil, { "HTTP_AUTHORIZATION" => api_key.token }

      expect(last_response).to be_ok
      expect(last_json_response).to include({
        "from" => "EUR",
        "to" => "USD",
        "rate" => 0.6
      })
    end

    it "accepts only USD and EUR" do 
      get "/api/v1/exchange_rate?from=CAD&to=AUD", nil, { "HTTP_AUTHORIZATION" => api_key.token }

      expect(last_response.status).to eq(422)
    end
  end
end