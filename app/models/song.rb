class Song < ApplicationRecord
	belongs_to :disc

	validates :track_num, presence: true
	validates :song, presence: true
end
