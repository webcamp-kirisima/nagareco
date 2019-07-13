class CreateSells < ActiveRecord::Migration[5.2]
  def change
    create_table :sells do |t|
      t.integer :user_id
      t.integer :pay
      t.string :ship_address
      t.string :ship_tel
      t.string :ship_code
      t.string :ship_name
      t.integer :ship_cost
      t.integer :total
      t.integer :status

      t.timestamps
    end
  end
end
