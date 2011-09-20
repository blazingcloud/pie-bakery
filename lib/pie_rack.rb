$LOAD_PATH.unshift File.expand_path(File.join(File.dirname(__FILE__), "../../pie/."))
$LOAD_PATH.unshift File.expand_path(File.join(File.dirname(__FILE__), "../../pie/lib"))

require 'erb'
require 'pie'
require 'pie_server'


class PieGame
  include Pie
end


class PlayMiddleware < Sinatra::Base
  set :views, File.dirname(__FILE__) + '/views'

  def handle_error(game, e)
      puts "!!!!!!!!!!!!!!! PIE SCRIPT ERROR for #{game.name} !!!!!!!!!!!!!"
      game.error = true
      game.save
      puts e.message
      @message = e.message
      puts e.backtrace.inspect
      s = e.backtrace.find { |item| item =~ Regexp.new(game.name) }
      puts "s = #{s.inspect}"
      unless s.nil?
        match =  s.match(Regexp.new("#{game.name}:(\\d+)"))
        p match.inspect
        unless match.nil?
          line_num = match[1]      
          p line_num
           @message = "On line #{line_num}... " + @message  
        end
      end
      request.env["PIE_ERROR"] = e
      erb :error
  end

  get '/:game_id/*' do |game_id, stuff|
    puts "in PlayMiddleware.............................."
    game = Game.find(game_id)
    pie_instance = PieGame.new
    begin
      pie_instance.instance_eval("template :game_screen", game.name)
      puts "-------- about to eval pie code --------"
      puts game.script
      pie_instance.instance_eval(game.script, game.name)
      puts "-------- eval completed --------"
      request.env["PATH_INFO"].gsub!(Regexp.new("^/#{game_id}"), "")
      request.env["PIE_DATA"] = pie_instance
      game.error = false;
      game.save
      forward

    rescue SyntaxError => e
      handle_error(game, e)

    rescue ScriptError => e
      handle_error(game, e)

    rescue => e
      handle_error(game, e)
    end
  end
end
