class User < ApplicationRecord
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  	devise :database_authenticatable, :registerable,
         	:recoverable, :rememberable, :validatable

 	has_many :reviews, dependent: :destroy
 	has_many :mangas, dependent: :destroy
 	has_many :tomes, dependent: :destroy


end
