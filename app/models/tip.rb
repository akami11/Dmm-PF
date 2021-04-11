class Tip < ApplicationRecord
  belongs_to :user, optional: true
  
  validates :tip_contents, length: { maximum: 20 }
end
