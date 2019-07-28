class Product < ApplicationRecord
	belongs_to :genre
	belongs_to :label
	belongs_to :artist

	has_many :discs,  dependent: :destroy
	has_many :songs, through: :discs
	attachment :image
	has_many :line_items
  	before_destroy :referenced_by_line_item


	def self.select_shop
	where("date <= ?","now()").sell(cd_title: "ASC")
    end
	accepts_nested_attributes_for :discs, allow_destroy: true

	validates :cd_title, presence: true
	validates :artist, presence: true
	validates :image, presence: true
	validates :notax_price, presence: true
	validates :label, presence: true
	validates :genre, presence: true
	validates :stock, presence: true, numericality: { :greater_than => 0 }

    private
	def referenced_by_line_item

		if line_items.empty?
			return true
		else
			errors.add(:base, '品目が存在します。')
			retuen false
		end
	end
end
