$LOAD_PATH.unshift File.expand_path(File.join(File.dirname(__FILE__), "../../pie/."))
$LOAD_PATH.unshift File.expand_path(File.join(File.dirname(__FILE__), "../../pie/lib"))

require 'erb'
require 'pie'
require 'pie_server'


class PieThing
  include Pie

  def get_binding
    binding
  end
end


class PlayMiddleware < Sinatra::Base
  set :views, File.dirname(__FILE__) + '/views'

  def handle_error(e)
      puts "!!!!!!!!!!!!!!! PIE SCRIPT ERROR!!!!!!!!!!!!!"
      @exception = request.env["PIE_ERROR"] = e
      erb :error
  end

  get '/:game_id/*' do |game_id, stuff|
    puts "in PlayMiddleware.............................."
    game = Game.find(game_id)
    thing = PieThing.new
    begin
      puts "-------- about to eval pie code --------"
      puts game.script
      eval(game.script, thing.get_binding)
      puts "-------- eval completed --------"
      request.env["PATH_INFO"].gsub!(Regexp.new("^/#{game_id}"), "")
      request.env["PIE_DATA"] = thing
      forward

    rescue SyntaxError => e
      handle_error(e)

    rescue ScriptError => e
      handle_error(e)

    rescue => e
      handle_error(e)
    end
  end
end
