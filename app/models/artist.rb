class Artist < ApplicationRecord
	has_many :products, dependent: :destroy

	validates :artist, presence: true
end
