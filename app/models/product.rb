class Product < ApplicationRecord
	validates :name, :price, presence: true
	mount_uploader :image, AvatarUploader
	has_many :reviews
	has_many :favorites, dependent: :destroy
end
