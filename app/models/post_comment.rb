class PostComment < ApplicationRecord
  
  # PostComment モデルに対して、User モデルとの関係性を追加していきます。
  # PostComment モデルに関連付けられるのは、1 つの User モデルです。
  # このため、単数形の「user」になっている点に注意しましょう。
  belongs_to :user
  
  # PostComment モデルに対して、PostImage モデルとの関係性を追加していきます。
  # PostComment モデルに関連付けられるのは、1 つの PostImage モデルです。
  # このため、単数形の「post_image」になっている点に注意しましょう。
  belongs_to :post_image
  
end
