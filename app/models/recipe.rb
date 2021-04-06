class Recipe < ApplicationRecord
  belongs_to :user, optional: true
  has_many :ingredients,dependent: :destroy
  accepts_nested_attributes_for :ingredients, allow_destroy: true
  
  attachment :recipe_image
end
