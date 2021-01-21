class Tome < ApplicationRecord
	belongs_to :manga
	belongs_to :user
	has_many :reviews, dependent: :destroy
end
