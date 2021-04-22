class Category < ApplicationRecord
  has_many :foods,dependent: :destroy
  
  # validates :category_name, presence: true
end
