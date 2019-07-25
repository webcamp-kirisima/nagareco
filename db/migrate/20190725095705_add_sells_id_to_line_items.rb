class AddSellsIdToLineItems < ActiveRecord::Migration[5.2]
  def change
    add_column :line_items, :sell_id, :integer
  end
end
