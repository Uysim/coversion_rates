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

### Setup Database

```
bundle exec rake db:create 
bundle exec rake db:migrate
```

### Start Server 

```
bundle exec puma
```

### Run Test 

```
bundle exec rake db:test:prepare
bundle exec rspec
```

### Exchange Rates

- I am getting exchange rates from [European Central Bank](https://www.ecb.europa.eu) via Gem [eu_central_bank](https://github.com/RubyMoney/eu_central_bank)
- TO DO: Change to update rates with cronjob or background job. Currently, update on app start for testing purpose only


### Run App with docker

```
docker-compose up
```
then server will be available at `http://localhost:3000`


### API

##### Create project

`POST /api/v1/projects`

Example response:
```json
{
  id: 1,
  api_keys: [{
    id: 1, 
    token: "rkU7cRepk9DuoaqecZFH6RdQ" // Authorization token key
  }]
}
```

##### Delete Project

`DELETE /api/v1/projects/:project_id`

headers
- `Authorization` api key from project 



##### Create API Key

`POST /api/v1/api_keys`

headers
- `Authorization` token from one of api key in project

Example response:
```json
{
  id: 1,
  token: "rkU7cRepk9DuoaqecZFH6RdQ" // Authorization token key
}
```

##### Delete API Key

`DELETE /api/v1/api_keys/current`

headers
- `Authorization` token of api key you want to delete


##### Reload API Key

`POST /api/v1/api_keys/current/reload`

headers
- `Authorization` token of api key you want to regenerate token


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
