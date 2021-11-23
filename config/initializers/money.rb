Money.default_bank = Money::Bank::VariableExchange.new(ExchangeRate)
Money.rounding_mode = BigDecimal::ROUND_HALF_EVEN

eu_bank = EuCentralBank.new
Money.default_bank = eu_bank

# it should be update by cronjob or background job
# currently, I just update it every time I run the app for testing purpose
eu_bank.update_rates