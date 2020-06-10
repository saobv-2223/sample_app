source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.6"

gem "rails", "~> 6.0.3", ">= 6.0.3.1"
gem "sqlite3", "~> 1.4"
gem "mysql2"
gem "puma", "~> 4.1"
gem "sass-rails", ">= 6"
gem "webpacker", "~> 4.0"
gem "turbolinks", "~> 5"
gem "i18n"
gem "jbuilder", "~> 2.7"
gem "bootstrap-sass", "3.4.1"
gem "bootsnap", ">= 1.4.2", require: false
gem "bcrypt", "3.1.11"
gem "config"
gem "jquery-rails", "4.3.1"
gem "faker", "1.7.3"
gem "kaminari"
gem "bootstrap-kaminari-views"
gem "figaro"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", "~> 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
  gem "webdrivers"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
