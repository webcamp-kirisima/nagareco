class LineItem < ApplicationRecord

	belongs_to :product
	belongs_to :cart
	belongs_to :sell

	def total_price
		product.notax_price * quantity
	end
end
