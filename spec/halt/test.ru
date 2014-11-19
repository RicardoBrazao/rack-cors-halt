require 'rack/cors/halt'
require 'rack/cors'

use Rack::Cors do
  allow do
    origins '*'
    resource '/valid', :headers => :any, :methods => [:get, :post, :put, :path, :delete]
  end

  allow do
    origins 'http://yadayada:3000'
    resource '/not_to_everyone', :headers => :any, :methods => [:get, :post, :put, :path, :delete]
  end
end

use Rack::Cors::Halt