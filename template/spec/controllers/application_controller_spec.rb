require 'minitest_helper'

describe SAT::Application::ApplicationController do
  include Rack::Test::Methods

  def app
    SAT::Application
  end
end
