source 'https://rubygems.org'

gem 'rails', '4.1.4'
gem 'pg'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'jbuilder'
gem 'devise'
gem "rolify"
gem 'cancan'
gem 'foundation-rails'
gem 'font-awesome-rails'

group :development do
	gem 'spring'
	gem 'quiet_assets'
	gem 'better_errors'
  gem "binding_of_caller"
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development, :test do
  gem 'rspec-rails'
  gem "factory_girl_rails"
end

group :test do
  gem 'capybara'
  gem "capybara-email"
  gem 'shoulda-matchers'
end

group :production do
  gem 'rails_12factor'
end

ruby '2.1.2'