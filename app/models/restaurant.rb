class Restaurant < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :reviews, dependent: :destroy
  belongs_to :user
  validates :name, presence: true
  validates :user_id, presence: true
end
