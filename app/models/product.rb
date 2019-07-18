class Product < ApplicationRecord
	belongs_to :genre
	belongs_to :label
	belongs_to :artist

	has_many :discs,  dependent: :destroy
	has_many :songs, through: :discs
	has_many :cartitems, dependent: :destroy
	has_many :product_images, dependent: :destroy
	attachment :image
	accepts_nested_attributes_for :discs, allow_destroy: true
end
