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