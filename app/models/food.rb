class Food < ApplicationRecord

  belongs_to :category, optional: true
  belongs_to :user, optional: true

  attachment :food_image
end
