rack-cors-halt
==============

This gem provides support to prevent a request from hitting the controller when the CORS validation fails.


Important notice
==============

This gem will only work for gem [Rack::Cors](https://github.com/cyu/rack-cors) at version '0.3.0'.
At this time, November 18th 2014, the '0.3.0' version is in the 'master' branch, so you need to include the gem like this
```ruby
gem 'rack-cors', :require => 'rack/cors', github: "cyu/rack-cors", branch: 'master'
```
## Installation
In your `Gemfile` add the line

```ruby
  gem 'rack-cors-halt'
```
and then run
```
bundle
```
or install it yourself with
```
gem install rack-cors-halt
```

## Configuration

### Rack

In the `config.ru`file you need to configure the `Rack::Cors::Halt` middleware by passing it in the `use` command:

```ruby
use Rack::Cors::Halt
```

### Rails

In your `config/application.rb` you'll need something like this:

```ruby
module YourApp
  class Application < Rails::Application

    # ...

    config.middleware.insert_before 1, "Rack::Cors::Halt"
      
  end
end
```
why `.insert_before 1`? Typically the first middleware will be the `Rack::Cors` one, so the best approach is to place the `Rack::Cors::Halt` beneath that one so no more middlewares are runned.
