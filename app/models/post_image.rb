class PostImage < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :shop_name, presence: true
  validates :image, presence: true

  def get_image
    unless image.attached?
      #<Pathname:/Users/yuu/Desktop/Meshitero_rails6.1.4/app/assets/images/no_image.jpg>
      file_path = Rails.root.join("app/assets/images/no_image.jpg")
      # file_path = Pathname("#{Rails.root}/app/assets/images/no_image.jpg")
      image.attach(io: File.open(file_path), filename: "default-image.jpg", content_type: "image/jpeg")
    end
    image

    # カリキュラム(省略)
    # if image.attached?
    #   image
    # else
    #   "no_image.jpg"
    # end

    # 省略なし(self付き)
    # if self.image.attached?
    #   self.image
    # else
    #   "no_image.jpg"
    # end

    # 三項演算子
    # image.attached? ? image : "no_image.jpg"
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
