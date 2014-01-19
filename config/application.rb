require 'bundler'
require 'forwardable'

Bundler.require :default, ENV['RACK_ENV']

module SAT
  module Application
    # require the application helpers
    require File.expand_path(File.join('app', 'helpers', 'application_helpers'))
    # require the application controller
    require File.expand_path(File.join('app', 'controllers', 'application_controller'))

    extend SingleForwardable
    def_single_delegators ApplicationController, :call, :configure, :new, :settings

    require File.expand_path(File.join('config', 'environment'))
    Dir[File.join('config', 'environments', '**/*.rb')].each { |file| require File.expand_path(file) }

    # require the application's initializers
    Dir[File.join('config', 'initializers', '**/*.rb')].each { |file| require File.expand_path(file) }
    # require the rest of the helpers
    Dir[File.join('app', 'helpers', '**/*.rb')].each { |file| require File.expand_path(file) }
    # require the rest of the controllers
    Dir[File.join('app', 'controllers', '**/*.rb')].each { |file| require File.expand_path(file) }
    # require the models
    Dir[File.join('app', 'models', '**/*.rb')].each { |file| require File.expand_path(file) }
  end
end
