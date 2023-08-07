class PostImage < ApplicationRecord
  # PostImage モデルには、ActiveStorage を使って画像を持たせます。
  has_one_attached :image 
end
