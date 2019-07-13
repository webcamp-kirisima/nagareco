class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :genre_id
      t.integer :label_id
      t.integer :artist_id
      t.string :cd_title
      t.integer :notax_price
      t.integer :stock
      t.integer :stock_status

      t.timestamps
    end
  end
end
