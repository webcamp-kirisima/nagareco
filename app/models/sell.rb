class Sell < ApplicationRecord
	acts_as_paranoid
	belongs_to :user
	has_many :sell_details, dependent: :destroy

	def add_items(cart)
		cart.line_items.each do |item|
			item.cart_id = nil
			line_items << item
		end
	end

	enum pay: { クレジット:0, 銀行振込:1, 代引:2 }

end
