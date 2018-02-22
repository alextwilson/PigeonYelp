class Review < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  validates :rating, :inclusion => { :in => 1..5 }, presence: true
  validates :user_id, presence: true
end
