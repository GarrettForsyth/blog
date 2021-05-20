source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'codemirror-rails'
gem 'jbuilder', '~> 2.7'
gem 'puma', '~> 4.3'
gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'
gem 'will_paginate', '~> 3.1.0'

# Use Active Storage variant
gem 'image_processing', '~> 1.2'
gem 'mini_magick'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'cucumber-rails', require: false
  gem 'factory_bot_rails'
  gem 'faker', git: 'https://github.com/faker-ruby/faker.git', branch: 'master'
  gem 'irb', require: false
  gem 'rspec-rails', '~> 4.0.0'
  gem 'shoulda-matchers', '~> 4.0'
  gem 'shoulda-matchers-cucumber'
  gem 'sqlite3', '~> 1.4'
end

group :development do
  gem 'guard'
  gem 'guard-cucumber', require: false
  gem 'guard-rspec', require: false
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'database_cleaner-active_record'
  gem 'rails-controller-testing'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

group :production do
  gem 'aws-sdk-s3', '~> 1', require: false
  gem 'pg', '~> 1.2.3'
end
