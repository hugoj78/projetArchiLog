class Review < ApplicationRecord
	validates :description, :rating, presence: true
	belongs_to :tome
	belongs_to :user
end
