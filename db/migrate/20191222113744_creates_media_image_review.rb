class CreatesMediaImageReview < ActiveRecord::Migration[6.0]
  def up
    create_table :media do |t|
      t.string :name, null: false
      t.string :origin_name, null: false
      t.text :desc
      t.decimal :rating, precision: 3, scale: 3
      t.string :type, null: false
      t.date :release
      t.belongs_to :image
    end
    create_table :images do |t|
      t.string :URL
      t.belongs_to :users
      t.belongs_to :media
    end
    create_table :reviews do |t|
      t.belongs_to :users
      t.timestamps
      t.belongs_to :media
    end
  end

  def down
    drop_table :media
    drop_table :images
    drop_table :reviews
  end
end
