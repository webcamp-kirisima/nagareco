class AddUserIdToLineItems < ActiveRecord::Migration[5.2]
  def change
    add_column :line_items, :user_id, :integer
  end
end
