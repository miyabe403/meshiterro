class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #（パスワードの正確性を検証）（ユーザ登録や編集、削除）
  #（パスワードをリセット）（ログイン情報を保存）（email のフォーマットなどのバリデーション）

  # User モデルに対して、PostImage モデルが 1:N になるよう関連付けます。
  has_many :post_images, dependent: :destroy

end
