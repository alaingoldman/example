source 'https://rubygems.org'

gem 'rails', '3.2.13'
gem 'haml'
gem 'haml-rails'
gem 'bcrypt-ruby', :require => 'bcrypt'
gem 'aws-sdk'
gem "nested_form"
# gem "koala", "~> 1.7.0rc1"
gem 'balanced'
  

# for easy adding and removing in a nested form

# for image attachment upload
gem 'paperclip', :git => 'git://github.com/thoughtbot/paperclip.git'

group :development, :test do
  gem 'sqlite3', '1.3.5'
  gem 'rspec-rails', '2.11.0'
  gem "factory_girl_rails"
  gem 'capybara'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry-rails'
end

# Gems used only for assets and not required 
# in production environments by default.
group :assets do
  gem 'sass-rails',   '3.2.5'
  gem 'coffee-rails', '3.2.2'
  gem 'uglifier', '1.2.3'
  gem "jquery-fileupload-rails"
  gem "therubyracer"
end

gem 'jquery-rails', '2.0.2'

group :test do
end

group :production do
  gem 'pg', '0.12.2'
end
# this is to keep note of profane language
# not in use !!
# gem "profanity_filter"