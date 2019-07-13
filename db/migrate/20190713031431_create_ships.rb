class CreateShips < ActiveRecord::Migration[5.2]
  def change
    create_table :ships do |t|
      t.integer :user_id
      t.string :name
      t.string :address
      t.string :tel
      t.string :code

      t.timestamps
    end
  end
end
