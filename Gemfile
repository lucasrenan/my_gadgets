source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.1'

gem 'mongoid', github: 'mongoid/mongoid'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
# gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails', '~> 3.0.4'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

gem 'devise', '~> 3.2.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development do
  gem 'clean_logger',     '~> 0.0.5'
  gem 'guard-livereload', '~> 2.0.1'
  gem 'rack-livereload',  '~> 0.3.15'
  gem 'yajl-ruby',        '~> 1.1.0'
end

group :development, :test do
  gem 'guard',              '~> 2.2.4'
  gem 'factory_girl_rails', '~> 4.3.0'
  gem 'rspec-rails',        '~> 2.14.0'
  gem 'mongoid-rspec',      '~> 1.9.0'
end

group :test do
  gem 'guard-rspec',      '~> 4.0.4'
  gem 'spork-rails',      '~> 4.0.0'
  gem 'guard-spork',      '~> 1.5.1'
  gem 'rb-fsevent',       '~> 0.9.3'
  gem 'capybara',         '~> 2.2.0'
  gem 'database_cleaner', '~> 1.2.0'
  gem 'simplecov',        '~> 0.8.2', require: false
end
