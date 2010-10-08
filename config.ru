# This file is used by Rack-based servers to start the application.
require File.expand_path('../lib/pie_rack', __FILE__)

require 'pie_server'

map '/play' do
  use PlayMW
  run WebApp
end

require ::File.expand_path('../config/environment',  __FILE__)

map '/' do
   run Bakery::Application
end