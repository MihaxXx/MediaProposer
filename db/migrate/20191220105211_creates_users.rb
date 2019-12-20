class CreatesUsers < ActiveRecord::Migration[6.0]
  def up
    create_table :users do |t|
      t.string :login, null: false
      t.string :password, null: false
      t.string :email, null: false
    end
  end

  def down
    drop_table :users
  end
end
