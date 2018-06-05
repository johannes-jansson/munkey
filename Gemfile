# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.5.1"

gem "dotenv-rails", "~> 2.4", groups: [:development, :test]

# Bundle edge Rails instead: gem "rails", github: "rails/rails"
gem "rails", "~> 5.2.0"
# Use postgresql as the database for Active Record
gem "pg", ">= 0.18", "< 2.0"
# Use Puma as the app server
gem "puma", "~> 3.11"
# Use SCSS for stylesheets
gem "sass-rails", "~> 5.0"
# Use Uglifier as compressor for JavaScript assets
gem "uglifier", ">= 1.3.0"
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem "mini_racer", platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem "coffee-rails", "~> 4.2"
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks", "~> 5"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.5"
# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"
# Use ActiveModel has_secure_password
# gem "bcrypt", "~> 3.1.7"

gem "jquery-rails", "~> 4.3.3"
gem "sass", "~> 3.5"
gem "haml", "~> 5.0"
gem "bootstrap", "~> 4.1"
gem "font-awesome-rails", "~> 4.7"

gem "concurrent-ruby", "~> 1.0"

gem "sentry-raven", "~> 2.7"

gem "rubocop", "~> 0.56", require: false

# Use ActiveStorage variant
# gem "mini_magick", "~> 4.8"

gem "simple-rss"
gem "discordrb", github: "lisinge/discordrb", branch: "fix_server_role_delete_event"
gem "pry"
gem "google-cloud-vision", require: "google/cloud/vision"
gem "parslet"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.1.0", require: false

group :development, :test do
  # Call "byebug" anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling "console" anywhere in the code.
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem "capybara", ">= 2.15", "< 4.0"
  gem "selenium-webdriver"
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem "chromedriver-helper"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
