source 'https://rubygems.org'

gem 'rails', '3.2.11'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'
gem 'therubyracer', "~>0.11.4"
gem 'pry'
gem 'pry-doc'
gem 'devise' 
gem 'mail'
gem 'jquery-rails'
gem 'whenever', require: false
gem 'ledermann-rails-settings', "~>1.2.1", :require => 'rails-settings'
gem 'brakeman'
gem 'cancan'
gem 'rails_admin'
gem 'html-pipeline'
gem 'twitter-bootstrap-rails'
gem 'libv8', '>3.11.8'
gem 'less-rails'
gem 'sidekiq'
gem 'sinatra', require: false
gem 'slim'
gem 'gritter', "1.0.3"
gem 'declarative_authorization'
gem 'tinymce-rails'
gem 'capistrano'
gem 'capistrano-ext'
gem 'capify-ec2'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platform => :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :test do
	gem 'shoulda-matchers'
	gem 'cucumber-rails', :require => false
	gem 'launchy'
	gem "factory_girl_rails", "~> 4.0"
	# A gem providing "time travel", "time freezing" and "time acceleration" 
	# capabilities, making it dead simple to test time-dependent code
	# gem "timecop"
end

group :tests, :development do
	gem "redis", "~> 3.0.2"
	gem "rspec-rails", "~> 2.0"
	gem "faker"
	gem 'capybara'
	gem 'database_cleaner'
	gem 'guard-rspec'
	gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i
	gem 'timecop'
end

group :development do
	gem 'better_errors'
	gem 'binding_of_caller'
	gem 'meta_request'
	gem 'growl'
	gem 'ruby_gntp'
end

 

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :production do
	gem 'mysql2'
end
