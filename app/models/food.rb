class Food < ApplicationRecord

  belongs_to :category, optional: true
  belongs_to :user, optional: true

  attachment :food_image
  
  def ratio
    ( protein / calorie).round(3)
    # ceilは切り上げ、floorが切り捨て、roundが四捨五入 round(N)と指定することでN桁目を四捨五入
  end
end
