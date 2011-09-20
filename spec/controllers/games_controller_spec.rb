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

    it "updates the game" do
      put :update, :id => game.id, :game =>{ :author => "Fred"}
      game.reload.author.should == "Fred"
    end

    it "updates the game when there is a script error" do
      bad_code = "place end:'this will not work'"
      put :update, :id => game.id, :game =>{ :script => bad_code}
      game.reload.script.should == bad_code
    end
  end

  describe "DELETE destroy" do
    let (:game) { Factory(:game) }

    before do
      @id = game.id
      delete :destroy, :id => @id
    end

    it "redirects to games index" do
      response.should redirect_to games_path
    end

    it "marks game as deleted (but doesn't really delete it)" do
      saved_game = Game.find(@id)
      saved_game.should_not be_nil
      saved_game.should be_deleted
    end
  end

end
