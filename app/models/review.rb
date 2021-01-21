class Review < ApplicationRecord
	belongs_to :tome
	belongs_to :user
end
