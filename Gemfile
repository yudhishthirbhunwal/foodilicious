source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.3', '>= 6.1.3.2'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
gem 'image_processing', '~> 1.2'

# bootstrap-sass is a Sass-powered version of Bootstrap 3
gem 'bootstrap-sass', '~> 3.4'
# Simple authorization solution for Rails which is decoupled from user roles. All permissions are stored in a single location.
gem 'cancancan'
# A Scope & Engine based paginator.
gem 'kaminari'
# Flexible authentication solution for Rails with Warden.
gem 'devise', '~> 4.7'
# Faker is used to generate fake data.
gem 'faker', '~> 2.17'
# An XML toolkit for Ruby
gem 'rexml', '~> 3.2'
# Validations for active storage database.
gem 'active_storage_validations', '~> 0.8.9'
# Manipulate images with minimal use of memory via ImageMagick / GraphicsMagick
gem 'mini_magick', '~> 4.5'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3', '~> 1.4'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'

  # Minitest provides a complete suite of testing facilities supporting TDD.
  gem 'minitest', '~> 5.14'
  gem 'minitest-reporters', '~> 1.4'
  # Guard is a command line tool to easily handle events on file system modifications.
  gem 'guard', '~> 2.16'
  # Guard::Minitest automatically run your tests with Minitest framework
  gem 'guard-minitest', '~> 2.4'
  # Extracts `assigns` and `assert_template` from ActionDispatch.
  gem 'rails-controller-testing', '~> 0.0.3'
end


group :production do
  # Adds postgreSQL for use in production.
  gem 'pg', '~> 1.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
