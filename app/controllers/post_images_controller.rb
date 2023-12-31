class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end

  # 投稿データの保存
  def create
    @post_image = PostImage.new(post_image_params) # 投稿するデータを PostImage モデルに紐づくデータとして保存する準備している
    @post_image.user_id = current_user.id  # 空のモデルでは、"[モデル名].[カラム名]"という形で、保存する。 current_user は、ログイン中のユーザー情報を取得することができる

    if @post_image.save
      redirect_to post_images_path
    else
      render :new
    end
  end

  def index
    @post_images = PostImage.page(params[:page])  # 1ページ分の決められた数のデータだけを、新しい順に取得する
  end
 
  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new  # コメントを投稿するためのインスタンス変数を定義
  end
  
  def destroy
    post_image = PostImage.find(params[:id])
    post_image.destroy
    redirect_to '/post_images'
  end

  # 投稿データのストロングパラメータ
  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
end
