$LOAD_PATH.unshift File.expand_path(File.join(File.dirname(__FILE__), "../../pie/."))
$LOAD_PATH.unshift File.expand_path(File.join(File.dirname(__FILE__), "../../pie/lib"))

require 'pie'
require 'pie_server'

class PieThing
  include Pie

  def get_binding
    binding
  end
end


class PlayMiddleware < Sinatra::Base
  get '/:game_id/*' do |game_id, stuff|
    puts "in PlayMiddleware.............................."
    game = Game.find(game_id)
    thing = PieThing.new
    eval(game.script, thing.get_binding)
    request.env["PATH_INFO"].gsub!(Regexp.new("^/#{game_id}"), "")
    request.env["PIE_DATA"] = thing
    forward
  end
end
