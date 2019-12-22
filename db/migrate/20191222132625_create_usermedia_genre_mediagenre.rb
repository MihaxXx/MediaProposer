class CreateUsermediaGenreMediagenre < ActiveRecord::Migration[6.0]
  def up
    create_table :usermedia do |t|
      t.belongs_to :user, null: false
      t.belongs_to :media, null: false
    end
    create_table :genre do |t|
      t.string :name, null: false
    end
    create_table :mediagenre do |t|
      t.belongs_to :media
      t.belongs_to :genre
    end
  end

  def down
    drop_table :usermedia
    drop_table :genre
    drop_table :mediagenre
  end
end
