class Recipe < ApplicationRecord
  belongs_to :user
  has_many :ingredients
  validates :name, :image_url, :description, :instructions, presence: true
  accepts_nested_attributes_for :ingredients
end
