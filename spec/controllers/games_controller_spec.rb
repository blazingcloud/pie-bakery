require 'spec_helper'

describe GamesController do
  describe "POST create" do
    it "redirects to edit screen" do
      post :create, "game"=>{"script"=>"place start:\"You are on a beach. Your ship is no where in sight.\"",
                             "name"=>"Battle of Monkey Island",
                             "author"=>"Stacey"}
      new_game = assigns[:game]
      new_game.should_not be_nil
      response.should redirect_to edit_game_path(new_game)
    end
  end
  describe "PUT update" do
    let (:game) { Factory(:game) }

    it "redirects to edit screen" do
      put :update, :id => game.id, :game =>{ :author => "Fred"}
      response.should redirect_to edit_game_path(game)
    end
  end
end
