require 'minitest_helper'

describe SAT::Application::RootHelpers do
  include Rack::Test::Methods

  def app
    SAT::Application
  end
end
