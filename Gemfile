source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

gem "rails", "~> 7.0.8"
gem "rails-i18n", "~> 7.0.0"
gem 'hotwire-rails'
gem "devise"
gem "devise-i18n"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "tailwindcss-rails"
gem "jbuilder"
gem "redis", "~> 4.0"
gem 'sidekiq'
gem 'kaminari'
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem "dotenv-rails", groups: %i[development production test]

group :development, :test do
  gem 'awesome_print'
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "factory_bot_rails"
  gem "faker"
  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-doc'
  gem 'pry-rails'
  gem 'pry-rescue'
  gem 'pry-theme'
  gem "rspec-rails", "~> 6.0.0"
  gem "rubocop"
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-rspec", require: false
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem 'database_cleaner-active_record'
  gem "selenium-webdriver"
  gem "shoulda-matchers"
end
