source 'http://rubygems.org'

gem 'rails', '3.1.0'
gem 'thin'
gem 'less-rails-bootstrap'

gem 'sinatra'
gem 'pie', '0.2.13'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3'
  gem 'heroku'
  gem 'taps'

  gem 'cucumber-rails'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'rspec-rails'
  gem 'factory_girl_rails'


end


