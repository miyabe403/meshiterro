class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #（パスワードの正確性を検証）（ユーザ登録や編集、削除）
  #（パスワードをリセット）（ログイン情報を保存）（email のフォーマットなどのバリデーション）

  # User モデルに対して、PostImage モデルが 1:N になるよう関連付けます。
  has_many :post_images, dependent: :destroy

  # profile_imageという名前でActiveStorageでプロフィール画像を保存
  has_one_attached :profile_image
  
  # get_image メソッド =特定の処理を名前で呼び出すことができる 
  def get_profile_image
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image-jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed # 画像サイズの変更を行っています
  end
end