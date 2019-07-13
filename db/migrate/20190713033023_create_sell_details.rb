class CreateSellDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :sell_details do |t|
      t.integer :Sell_id
      t.integer :products_id
      t.integer :sell_num

      t.timestamps
    end
  end
end
