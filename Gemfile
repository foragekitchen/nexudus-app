source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.3'

# Use Bootstrap ported to Sass for css framework
gem 'bootstrap-sass', '~> 3.3.5'
# Use Chosen for styling form elements - install compass-rails BEFORE Chosen and Sass for sprockets compatibility
gem "compass-rails", github: "Compass/compass-rails", branch: "master"
gem 'chosen-rails', '~>1.4.2'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

# Use Uglifier as compressor for JavaScript assets
# gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
# gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use HTTParty for consuming API's
gem 'httparty','0.13.5'

# Use Unit to convert measurements like feet to inches
gem 'ruby-units'

# Moment.js
gem 'momentjs-rails'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  # gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  # gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  # gem 'spring'

  # Dotenv for storing environment variables in development
  gem 'dotenv-rails'
end

group :test do
  # Use Rspec for testing
  gem 'rspec-rails', '~> 3.0'

  # Use Timecop for stubbing out (freezing) dates for proper date match in tests
  # Use Sinon for doing the same in Javascript
  gem 'timecop'
  gem 'sinon-rails'

  # Use Capybara for UI testing, with Selenium for support when needing to run javascript
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'poltergeist'

  # Use Guard for auto-running tests
  gem 'guard-rspec', require: false

  # Use WebMock for stubbing out API calls in tests
  gem 'webmock', require: false
end