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
	has_many :line_items
    before_destroy :referenced_by_line_item

	def self.select_shop
	where("date <= ?","now()").order(title: "ASC")
    end

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
