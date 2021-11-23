# Currencies Conversion App

App develop for money exchange API. Currently we support only 

### Technology stack

- Ruby 3.0.2
- Sinatra 
- Puma
- RSpec
- ActiveRecord

### Install Required Gems

```
bundle install
```

### Start Server 

```
bundle exec puma
```

### Run Test 

```
bundle exec rspec
```

### Exchange Rates

- I am getting exchange rates from [European Central Bank](https://www.ecb.europa.eu) via Gem [eu_central_bank](https://github.com/RubyMoney/eu_central_bank)
- TO DO: Change to update rates with cronjob or background job. Currently, update on app start for testing purpose only


### API

##### Create project

`POST /api/v1/projects`

Example response:
```json
{
  id: 1,
  api_key: "rkU7cRepk9DuoaqecZFH6RdQ" // api key for authorization
}
```


##### Exchange rate

`GET /api/v1/exchange_rate`
params 
- `from` - required
- `to` - required

headers
- `Authorization` api key from project 

Example response:
```json
{
  from: "USD",
  to: "EUR",
  rate: "0.8"
}
```