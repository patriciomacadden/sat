module SAT::Application
  class RootController < ApplicationController
    set prefix: '/'
    set views_prefix: '/root'

    helpers SAT::Application::RootHelpers

    get '/' do
      slim :index
    end
  end
end
