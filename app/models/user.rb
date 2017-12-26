class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :post_images
  attachment :profile_image

  validates :name, presence: true, uniqueness: true,
                  length: { minimum:2 , maximum:20 }
  validates :body, length: { maximum: 50 }

end
