# This file is used by Rack-based servers to start the application.
require File.expand_path('../lib/pie_rack', __FILE__)

map '/play' do
  use PlayMiddleware
  run Pie::WebApp
end

require ::File.expand_path('../config/environment',  __FILE__)

map '/' do
   run Bakery::Application
end