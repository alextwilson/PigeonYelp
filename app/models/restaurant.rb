class Restaurant < ApplicationRecord
  include ActiveModel::AttributeMethods
  has_many :reviews
  belongs_to :user
  validates :name, presence: true
  # define_attribute_methods 'owner'
  # attr_accessor :owner
end
