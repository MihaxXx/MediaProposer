class TurnOffTypeOfMediaCheck < ActiveRecord::Migration[6.0]
  def change
    change_column :media, :type, :string, null: true
  end
end
