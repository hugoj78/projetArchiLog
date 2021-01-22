class Manga < ApplicationRecord
	validates :name, presence: true
	belongs_to :user
	has_many :tomes, dependent: :destroy
	has_one_attached :photo
	  
	def self.search(search)
    	where("name LIKE ?", "%#{search}%")
    end
end
