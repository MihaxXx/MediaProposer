class AddPosterToImage < ActiveRecord::Migration[6.0]
  def change
    remove_column :media, :image_id
    add_column :media, :poster_url, :text
    drop_table :images
  end
end
