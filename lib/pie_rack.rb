$LOAD_PATH.unshift File.expand_path(File.join(File.dirname(__FILE__), "../../pie/."))
$LOAD_PATH.unshift File.expand_path(File.join(File.dirname(__FILE__), "../../pie/lib"))

require File.expand_path('../../../pie/lib/pie', __FILE__)
#require 'pie'

class PieThing
  include Pie

  def get_binding
    binding
  end
end

require 'sinatra/base'

class WebApp < Sinatra::Base
  set :root, File.join(File.expand_path(File.dirname(__FILE__)), "..")

  get '/' do
    "hello"
  end

  get '/:place_name' do
    thing = request.env["PIE_THING"]
      name = params[:place_name].to_sym
      thing.current_place(name) unless name.nil?
      puts "current place name is #{thing.current_place.name}"
      puts "current place is #{thing.current_place.description}"
      puts "--- skip out"; return if thing.current_place.nil?
      puts "current links are #{thing.current_place.paths.inspect}"
      puts "displaying template: #{thing.template.inspect}"
      erb thing.template, {}, {:thing => thing}
  end
end


class PlayMW < Sinatra::Base
  get '/:game_id/*' do |game_id, stuff|
    game = Game.find(game_id)
    thing = PieThing.new
    eval(game.script, thing.get_binding)
    request.env["PATH_INFO"].gsub!(Regexp.new("^/#{game_id}"), "")
    request.env["PIE_THING"] = thing
    forward
  end
end
