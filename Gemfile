source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~>6.1.1'
# Use MySQL as the database for Active Record
gem 'pg'
# gem 'mysql2', '0.3.17'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 6.0.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 2.6.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 5.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby
gem "figaro"
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', '~> 5.2.1'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.11.0'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 2.0.3', group: :doc
gem "puma"

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.9'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', '~> 1.2020.6', platforms: [:mingw, :mswin]

# Add bootstrap-sass for a theme
gem 'bootstrap-sass', '~> 3.4.1'

# Add kaminari for paging results
gem 'kaminari', '~> 1.2.1'

# Add flutie for helpers with title and body class
gem 'flutie', '~> 2.2.0'

# Add devise for user authentication
gem 'devise', '~> 4.7.3'

# Add cancancan for authorization
gem 'cancancan', '~> 3.2.1'

# Add country_select to provide a list of countries
gem 'countries', '~> 3.0.1'
gem 'country_select', '~> 4.0.0'

# Add delayed jobs so we can background tasks that aren't critical
gem 'daemons', '~> 1.3.1'
gem 'delayed_job', '~> 4.1.9'
gem 'delayed_job_active_record', '~> 4.1.5'

# Yay Stripe!
gem 'stripe', '~> 5.29.0'
gem 'stripe_event', '~> 2.3.1'

# Code quality tools
group :development do
  gem 'listen'
  gem 'bullet', '~> 6.1.3'
  # gem 'rails_best_practices', '~> 1.15.4'
  gem 'brakeman', '~> 4.10.1'
  gem 'rubocop', '~> 1.8.1'
end

# Testing tools
group :test, :development do
  gem 'pry-rails'
  gem 'faker', '~> 2.15.1'
  gem 'factory_girl_rails', '~> 4.9.0'
  gem 'database_cleaner', '~>  1.8.5'
  gem 'rspec', '~> 3.10.0'
  gem 'rspec-rails', '~> 4.0.2'
  gem 'rspec-mocks', '~> 3.10.1'
  gem 'stripe-ruby-mock', '~> 3.0.1'
end
