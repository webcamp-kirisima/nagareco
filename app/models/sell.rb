class Sell < ApplicationRecord
	belongs_to :user
	has_many :sell_details, dependent: :destroy

	enum pay: { クレジット:0, 銀行振込:1, 代引:2 }

end
