

class GamesController < ApplicationController


  # GET /games
  def index
    @games = Game.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /games/1
  # GET /games/1.xml
  def show
    redirect_to("/play/#{params[:id]}/start")
  end

  # GET /games/new
  def new
    @game = Game.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /games/1/edit
  def edit
    @game = Game.find(params[:id])
  end

  # POST /games
  def create
    @game = Game.new(params[:game])

    respond_to do |format|
      if @game.save
        format.html { redirect_to(edit_game_path(@game), :notice => 'Game was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /games/1
  def update
    @game = Game.find(params[:id])

    respond_to do |format|
      if @game.update_attributes(params[:game])
        format.html { redirect_to(edit_game_path(@game), :notice => 'Game was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /games/1
  def destroy
    @game = Game.find(params[:id])
    @game.destroy

    respond_to do |format|
      format.html { redirect_to(games_url) }
    end
  end
end
