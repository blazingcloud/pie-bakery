class AddDeletedToGames < ActiveRecord::Migration
  def change
    add_column :games, :deleted, :boolean, :default => false
  end
end
