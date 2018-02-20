class Restaurant < ApplicationRecord
  include ActiveModel::AttributeMethods
  has_many :reviews
  validates :name, presence: true
  # define_attribute_methods 'owner'
  attr_accessor :owner
end
