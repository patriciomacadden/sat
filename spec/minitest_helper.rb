#!/user/bin/env ruby
#coding: utf-8

require "simplecov"
SimpleCov.start

ENV['RACK_ENV'] = 'test'

require File.expand_path(File.join('config', 'application'))
