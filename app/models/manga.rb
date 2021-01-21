class Manga < ApplicationRecord
	validates :name, presence: true
  	has_many :tomes, dependent: :destroy
end
