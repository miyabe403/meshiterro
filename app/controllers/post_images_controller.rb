class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new 
  end
  
  # 投稿データの保存
  def create
    @post_image = PostImage.new(post_image_params) # 投稿するデータを PostImage モデルに紐づくデータとして保存する準備している
    @post_image.user_id = current_user.id  # 空のモデルでは、"[モデル名].[カラム名]"という形で、保存する。 current_user は、ログイン中のユーザー情報を取得することができる
     
    @post_image.save
    redirect_to post_images_path
  end

  def index 
    @post_images = PostImage.all
  end

  def show
    @post_image = PostImage.find(params[:id])
  end
  
  # 投稿データのストロングパラメータ
  private 
  
  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
end
