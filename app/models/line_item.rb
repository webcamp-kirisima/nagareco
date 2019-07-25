class LineItem < ApplicationRecord

    belongs_to :sell
	belongs_to :product
	belongs_to :cart

	def total_price
		product.notax_price * quantity
	end
end
