source "https://rubygems.org"

ruby "2.1.3"

gem "bourbon", "~> 3.2.1"
gem "coffee-rails"
gem "delayed_job_active_record"
gem "email_validator"
gem "flutie"
gem "high_voltage"
gem "jquery-rails"
gem "neat", "~> 1.5.1"
gem "pg"
gem "rack-timeout"
gem "rails", "4.1.4"
gem "recipient_interceptor"
gem "sass-rails", "~> 4.0.3"
gem 'haml-rails'
gem "simple_form"
gem "title"
gem "uglifier"
gem "unicorn"
gem 'kaminari'
gem 'underscore-rails'
gem 'bootstrap-sass', '~> 3.2.0'
gem 'bootstrap-datepicker-rails'
gem 'jquery-placeholder-rails'
gem 'spinjs-rails', git: 'https://github.com/Skizzk/spinjs-rails', branch: 'patch-1'
gem 'autoprefixer-rails'
gem "highcharts-rails", "~> 3.0.0"
gem "bcrypt"

group :development do
  gem "thin"
  gem "foreman"
  gem "spring"
  gem "spring-commands-rspec"
  gem 'guard-rails'
end

group :development, :test do
  gem "awesome_print"
  gem "byebug"
  gem "dotenv-rails"
  gem "factory_girl_rails"
  gem "pry-rails"
  gem "rspec-rails", "~> 2.14.0"
  gem 'terminal-notifier-guard'
  gem 'guard', require: false
end

group :test do
  gem "capybara-webkit", ">= 1.2.0"
  gem "database_cleaner"
  gem "formulaic"
  gem "launchy"
  gem "shoulda-matchers", require: false
  gem "timecop"
  gem "webmock"
  gem 'guard-rspec', require: false
end

group :staging, :production do
  gem 'rails_12factor'
  gem "newrelic_rpm", ">= 3.7.3"
end
