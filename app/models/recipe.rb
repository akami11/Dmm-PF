class Recipe < ApplicationRecord
  belongs_to :user, optional: true
  has_many :ingredients,dependent: :destroy
  
  #cocoonで子フォームを親と一緒に保存するための記述。accepts_nested_attributes_forというメソッドを使用
  accepts_nested_attributes_for :ingredients, allow_destroy: true
  validates :recipe_name, length: { maximum: 18 }
  validates :recipe_name, presence: true
  validates :ingredients, presence: true
  
  enum about_time: { berryshort: 0, short: 1, medium: 2, long: 3, berrylong: 4}
  
  attachment :recipe_image
end
