class RemoveSellIdFromLineItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :line_items, :sell_id, :integer
  end
end
