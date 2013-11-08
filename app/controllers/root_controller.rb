module SAT::Application
  class RootController < ApplicationController
    set prefix: '/'
    set views_prefix: '/root'

    helpers SAT::Application::RootHelpers

    get '/' do
      erb :index
    end
  end
end
