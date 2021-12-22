class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image

  has_many :post_images, dependent: :destroy

  def get_profile_image
    if profile_image.attached?
      profile_image
    else
      "sample-author1.jpg"
    end
  end
end
