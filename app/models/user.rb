class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :foods,dependent: :destroy
  has_many :recipes,dependent: :destroy
  has_many :tips,dependent: :destroy
  has_many :likes, dependent: :destroy

  attachment :profile_image
  
  validates :user_name, length: { maximum: 10 }
end
