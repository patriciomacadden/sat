#!/user/bin/env ruby
#coding: utf-8

require 'minitest_helper'

describe SAT::Application::RootController do
  include Rack::Test::Methods

  def app
    SAT::Application
  end

  describe 'GET /' do
    it 'must be ok' do
      get '/'
      last_response.must_be :ok?
      last_response.body.must_match 'Hello World'
      last_response.body.must_match 'Root World'
      last_response.body.must_match 'Hello Local World'
    end
  end
end
