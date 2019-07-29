class LineItem < ApplicationRecord

	belongs_to :product
	belongs_to :cart
	belongs_to :user, optional: true

	def total_price
		product.notax_price * quantity
	end
end
