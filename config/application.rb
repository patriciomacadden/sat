require 'bundler'
require 'forwardable'

Bundler.require :default, ENV['RACK_ENV']

module SAT
  module Application
    Dir[File.join('app', 'controllers', '**/*.rb')].each { |file| require File.expand_path(file) }

    extend SingleForwardable
    def_single_delegators ApplicationController, :call, :configure, :new, :settings

    require File.expand_path(File.join('config', 'environment'))
    Dir[File.join('config', 'environments', '**/*.rb')].each { |file| require File.expand_path(file) }
  end
end
