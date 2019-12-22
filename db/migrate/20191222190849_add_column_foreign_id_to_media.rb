class AddColumnForeignIdToMedia < ActiveRecord::Migration[6.0]
  def change
    add_column :media, :foreign_id, :bigint
  end
end
