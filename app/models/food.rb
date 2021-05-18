class Food < ApplicationRecord

  belongs_to :category
  belongs_to :user, optional: true

  attachment :food_image
  
  validates :food_name, length: { maximum: 11 }
  validates :calorie, presence: true
  validates :protein, presence: true
  
  def ratio
    ( protein / calorie * 1000).round(1)
    # ceilは切り上げ、floorが切り捨て、roundが四捨五入 round(N)と指定することでN桁目を四捨五入
  end
  
end
