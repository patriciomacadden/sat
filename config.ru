#!/user/bin/env ruby
#coding: utf-8

require File.expand_path(File.join('config', 'application'))

map '/css' do
  styles = Sprockets::Environment.new
  styles.append_path 'app/assets/stylesheets'
  run styles
end

map '/js' do
  scripts = Sprockets::Environment.new
  scripts.append_path 'app/assets/javascripts'
  run scripts
end

map '/' do
  run SAT::Application
end
