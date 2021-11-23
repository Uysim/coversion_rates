class ExchangeRatesController < BaseController
  before do 
    authenticate!
  end 

  get '/api/v1/exchange_rate' do
    result = RateExchanger.call(params.slice(:from, :to))
    if result.success?
      {
        from: result.from,
        to: result.to,
        rate: result.rate
      }.to_json
    else 
      status 422
      result.errors.to_json
    end
  end
end