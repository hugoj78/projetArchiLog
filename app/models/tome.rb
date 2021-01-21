class Tome < ApplicationRecord
	belongs_to :manga
	has_many :reviews, dependent: :destroy
end
