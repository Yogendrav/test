source 'https://rubygems.org'

gem 'rails', '3.2.8'

gem "mysql2", "~> 0.3.11"

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'json'

gem 'nested_form'

gem 'bootstrap-sass'

gem 'jquery_datepicker'

gem 'tzinfo'

gem 'awesome_nested_fields'

#login

gem 'devise'

#role

gem 'capistrano'

gem 'cancan'

gem 'rolify'

gem 'googlecharts'

#search

#gem "rd_searchlogic", "~> 3.0.1"

gem "meta_search"

#pagination

gem 'will_paginate'

gem 'wicked_pdf'

group :production do
	gem 'therubyracer'
	gem 'execjs'
end

group :development, :test do
  gem 'rspec-rails'
end


platforms :ruby do # linux
  gem 'unicorn'

  gem "wkhtmltopdf-binary"

  group :development do
    gem 'better_errors'
    gem 'binding_of_caller'
    gem 'meta_request'
  end
end
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano'

# To use debugger
# gem 'ruby-debug'
