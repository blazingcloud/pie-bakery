class AddErrorToGames < ActiveRecord::Migration
  def change
    add_column :games, :error, :boolean, :default => false
  end
end
