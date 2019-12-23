class RenameGenreTable < ActiveRecord::Migration[6.0]
  def change
    rename_table :genre, :genres
  end
end
