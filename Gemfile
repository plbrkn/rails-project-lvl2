# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

gem 'bootsnap', '>= 1.4.4', require: false
gem 'jbuilder', '~> 2.7'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.4', '>= 6.1.4.4'
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 5.0'

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'ancestry'
gem 'devise'
gem 'kaminari'
gem 'rollbar'
gem 'simple_form'
gem 'slim-rails'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'faker'
  gem 'rubocop-rails', require: false
  gem 'slim_lint'
  gem 'sqlite3', '~> 1.4'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'spring'
  gem 'web-console', '>= 4.1.0'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'minitest-power_assert'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

group :production do
  gem 'pg'
end
