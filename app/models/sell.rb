class Sell < ApplicationRecord
	belongs_to :user
	has_many :sell_details, dependent: :destroy
end
