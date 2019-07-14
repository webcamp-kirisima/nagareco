class Product < ApplicationRecord
	belongs_to :genre
	belongs_to :label
	belongs_to :artist

	has_many :discs, dependent: :destroy
	has_many :cartitems, dependent: :destroy
	attachment :image
end
