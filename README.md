# Figaro Secrets

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'figaro_secrets'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install figaro_secrets

## Usage

Currently, `figaro_secrets` only supports AWS Secrets Manager.

### Text secrets

Format: `secretsmanager:secret_name`

Example:
```ruby
# config/application.yml
GITHUB_API_TOKEN: "secretsmanager:github_api_token"
```

### JSON secrets

Format: `secretsmanager:secret_name:key`

Example:
```ruby
# config/application.yml
GITHUB_API_TOKEN: "secretsmanager:github:api_token"
```

## Debugging

Several rake tasks are available to assist in debugging secrets. You can specify the environment in a few different ways:

1. `RAILS_ENV`
2. `APP_ENV`
3. Task argument, e.g. `rake figaro_secrets:list[production]`

### List configuration

```
rake figaro_secrets:list
```

### Show secrets

```
rake figaro_secrets:secrets
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/allspiritseve/figaro_secrets.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
