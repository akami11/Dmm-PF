class Tip < ApplicationRecord
  belongs_to :user, optional: true
  has_many :likes, dependent: :destroy

  def like_by?(user)
    likes.where(user_id: user.id).exists?
  end
  
  validates :tip_contents, length: { maximum: 36 }
end
