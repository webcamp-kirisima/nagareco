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

	validates :cd_title, presence: true
	validates :artist, presence: true
	validates :image, presence: true
	validates :notax_price, presence: true
	validates :label, presence: true
	validates :genre, presence: true
	validates :stock, presence: true, numericality: { :greater_than => 0 }
end
