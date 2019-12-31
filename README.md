# Simple url shortener
Created in Ruby 2.6.5, Rails 6.0.1, postgresql

## Initialize
Pre-requisite: Requires rvm installed. Install via https://rvm.io/

Use `make setup` initialize the gemset and database.

## Application
`make server`

http://localhost:3000/

## Testing
`make test` or `rspec`

## Warnings
- Currently using beta `gem 'rspec-rails', '~> 4.0.0.beta3'` due to bug listed here: https://stackoverflow.com/questions/58581334/generated-rspec-controller-test-is-failing-with-wrong-number-of-arguments-given
