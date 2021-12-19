class PostImage < ApplicationRecord
  has_one_attached :image

  belongs_to :user

  def get_image
    # カリキュラム(省略)
    if image.attached?
      image
    else
      "no_image.jpg"
    end

    # 省略なし(self付き)
    # if self.image.attached?
    #   self.image
    # else
    #   "no_image.jpg"
    # end

    # 三項演算子
    # image.attached? ? image : "no_image.jpg"
  end
end
