class PostImage < ApplicationRecord
  # PostImage モデルには、ActiveStorage を使って画像を持たせます。
  has_one_attached :image
  
  # PostImage モデルに対して、User モデルとの関係性を追加していきます。
  # PostImage モデルに関連付けられるのは、1 つの User モデルです。
  # このため、単数形の「user」になっている点に注意しましょう。
  belongs_to :user
  
  # PostImage モデルに対して、PostComment モデルが 1:N になるよう関連付けます。
  has_many :post_comments, dependent: :destroy
  
  has_many :favorites, dependent: :destroy
  
  # get_image メソッド =特定の処理を名前で呼び出すことができる
  # unless = 画像が設定されない場合はimagesに格納されているno_image.jpgという画像をデフォルト画像としてActiveStorageに格納する
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
  
  # favorited_by?メソッドを作成 引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうかを調べます。
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
