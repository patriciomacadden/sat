# SAT

[Sinatra](https://github.com/sinatra/sinatra) Application Template.

## Features

* Sinatra modular application. Inspired by [travis-admin](https://github.com/travis-ci/travis-admin).
* Per-environment configuration in separated files.
* Separate routes in controllers.
* Separated directories for controllers' views.
* Per-controller helpers.
* [sinatra-contrib](https://github.com/sinatra/sinatra)
* [sinatra-partial](https://github.com/yb66/Sinatra-Partial)
* [i18n](https://github.com/svenfuchs/i18n).
* [minitest](https://github.com/seattlerb/minitest).
* [rack-test](https://github.com/brynary/rack-test).
* [thin](https://github.com/macournoyer/thin).

## Installation

* Clone the repository:

```bash
$ git clone git@github.com:patriciomacadden/sat.git
```

* Create a git repository and change the `origin`:

```bash
$ git remote rm origin
$ git remote add origin <YOUR_GIT_REPOSITORY>
```

* Change the application name (and commit the change):

```bash
$ APP_NAME=AwesomeApp; for i in `find . -type f | grep -v .git`; do if [ `grep SAT $i | wc -l` != 0 ]; then sed -i '' "s/SAT/$APP_NAME/g" $i; fi; done; git commit -am "SAT => $APP_NAME"
```

**Note**: Note the `APP_NAME` variable. You should change the application name
there.

## Creating a new controller

Let's create a controller for handling products.

* Create `app/controlers/products_controller.rb`

```ruby
module SAT::Application
  class ProductsController < ApplicationController
    set prefix: '/products'
    # views will be found in app/views/products directory.
    # If you want to change the views directory, use this
    # configuration option.
    # set views_prefix: '/some_other_directory'

    get '/' do
      # will render app/views/products/index.erb
      # erb :index
      'Hello World'
    end
  end
end
```

* Create `app/helpers/products_helpers.rb`

```ruby
module SAT::Application
  module ProductsHelpers
    # helper methods
  end
end
```

* Create the views directory

```bash
$ mkdir app/views/products
```

* Create `spec/controllers/products_controller_spec.rb`

```ruby
require 'minitest_helper'

describe SAT::Application::ProductsController do
  include Rack::Test::Methods

  def app
    SAT::Application
  end

  describe 'GET /products' do
    it 'must be ok' do
      get '/products'
      last_response.must_be :ok?
    end
  end
end
```

* Create `spec/helpers/products_helpers_spec.rb`

```ruby
require 'minitest_helper'

describe SAT::Application::ProductsHelpers do
  include Rack::Test::Methods

  def app
    SAT::Application
  end
end
```

## Custom settings

Two settings are introduced:

* `prefix`: It indicates where to map a controller. **Must** be used in every
controller.
* `views_prefix`: It indicates where to find the views. If not set, `prefix` is
used to find the views.

## Caveats

Since the application itself its a `Rack::Builder` that maps the different
controllers to a particular path, you need to use that builder to use any rack
middleware.

See an example:

```ruby
# in environment.rb:

config.builder.use Rack::Auth::Basic do |username, password|
  username == 'admin' && password == 'secret'
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

See the [LICENSE](https://github.com/patriciomacadden/sat/blob/master/LICENSE).
