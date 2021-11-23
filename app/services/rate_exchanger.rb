class RateExchanger
  DEFAULT_EXCHANGE = {
    "from" => 'EUR',
    "to" => 'USD'
  }.freeze

  class SchemaContract < Dry::Validation::Contract
    ACCEPT_CURRENCIES = %w(EUR USD).freeze

    params do 
      required(:from).filled(:string).value(included_in?: ACCEPT_CURRENCIES)
      required(:to).filled(:string).value(included_in?: ACCEPT_CURRENCIES)
    end

    rule(:from, :to) do
      key.failure('must be different') if values[:from] == values[:to]
    end
  end
  
  attr_reader :params

  def initialize(params)
    @params = params.empty? ? DEFAULT_EXCHANGE : params
  end

  def self.call(params)
    new(params).call
  end

  def call
    result = validate_params
    if result.success?
      OpenStruct.new(
        success?: true,
        from: result[:from],
        to: result[:to],
        rate: currency_rate(result[:from], result[:to])
      )
    else
      OpenStruct.new(
        success?: false,
        errors: result.errors
      ) 
    end
  end

  private 

  def validate_params
    contract = SchemaContract.new
    contract.call(params)
  end

  def currency_rate(from, to)
    Money.from_amount(1, from).exchange_to(to).to_f
  end
end