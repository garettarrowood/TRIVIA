# frozen_string_literal: true

source "https://rubygems.org"

ruby "2.3.3"

gem "rails", "5.0.2"
gem "pg"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.1.0"
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
  gem "web-console", "~> 2.0"
  gem "spring"
end
