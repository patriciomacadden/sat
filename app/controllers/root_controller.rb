module SAT::Application
  class RootController < ApplicationController
    set prefix: '/'
    set views_prefix: '/root'

    get '/' do
      slim :index
    end
  end
end
