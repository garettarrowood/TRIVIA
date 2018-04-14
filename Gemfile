# frozen_string_literal: true

source "https://rubygems.org"

ruby "2.5.1"

gem "rails", "5.2.0"
gem "pg", "0.20.0"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails"
gem "turbolinks"
gem "jbuilder", "~> 2.0"
gem "sdoc", "~> 0.4.0", group: :doc
gem "rails_12factor", group: :production
gem "rest-client"

group :development, :test do
  gem "rubocop", require: false
  gem "pry"
end

group :test do
  gem "rails-controller-testing"
  gem "rspec-rails"
  gem "factory_girl_rails"
  gem "database_cleaner"
end

group :development do
  gem "web-console", "3.5.1"
  gem "spring"
end
