class Product < ApplicationRecord
	belongs_to :genre
	belongs_to :label
	belongs_to :artist

	has_many :discs,  dependent: :destroy,  inverse_of: :product
	has_many :cartitems, dependent: :destroy
	attachment :image
	accepts_nested_attributes_for :discs
end
