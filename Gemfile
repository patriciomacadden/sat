source 'https://rubygems.org'

gem 'i18n'
gem 'sinatra', require: 'sinatra/base'
# or use master:
# gem 'sinatra', github: 'sinatra/sinatra', require: 'sinatra/base'
gem 'sinatra-contrib'
# or use master:
# gem 'sinatra-contrib', github: 'sinatra/sinatra-contrib'
gem 'sinatra-partial'
gem 'slim'
gem 'thin'

group :development, :test do
  gem 'rake'
end

group :test do
  gem 'minitest', require: 'minitest/autorun'
  gem 'rack-test', require: 'rack/test'
  gem 'simplecov', :require => false
end
