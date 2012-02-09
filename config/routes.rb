#require 'pie'
#require 'pie_server'
#include Pie

#def play
#  @game = Game.first
          #Game.find(params[:id])
#  eval(@game.script)

#  WebApp
#end

Bakery::Application.routes.draw do
  root to:"games#index"
  resources :games
  match "/about" => "games#about"
end
