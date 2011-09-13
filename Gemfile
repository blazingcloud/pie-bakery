source 'http://rubygems.org'

gem 'rails', '3.0.0'
gem 'thin'

gem 'sinatra'
gem 'pie', '0.2.13'


# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

group :production do
  gem 'pg'
end

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
group :development, :test do
  gem 'heroku'
  gem 'cucumber-rails'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'sqlite3-ruby', :require => 'sqlite3'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end
