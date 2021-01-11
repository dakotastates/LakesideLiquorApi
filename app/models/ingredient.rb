class Ingredient < ApplicationRecord
  belongs_to :recipe, optional: true
  validates :name, :quantity, presence: true
end
