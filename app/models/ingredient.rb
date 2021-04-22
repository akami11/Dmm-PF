class Ingredient < ApplicationRecord
  belongs_to :recipe
  validates :ingredient_name, :quantity, presence: true
end
