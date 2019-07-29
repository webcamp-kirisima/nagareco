class SellDetail < ApplicationRecord
	acts_as_paranoid
	belongs_to :sell
end
