class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images.page(params[:page]) # 特定のユーザ（@user）に関連付けられた投稿全て（.post_images）を取得し @post_imagesに渡す処理 
  end
 
  def edit 
    user = User.find(params[:id])  # 1. URLに含まれるユーザーidをparams[:id]で取得
    unless user.id == current_user.id  # 2. ログインしているユーザーのidをcurrent_user.idで取得
      redirect_to post_images_path  # 3. 1と2のidが一致していなかった場合、 投稿一覧にリダイレクトする
      
    # @user = User.find(params[:id])
  end
  
  def update
    user = User.find(params[:id])  # 1. URLに含まれるユーザーidをparams[:id]で取得
    unless user.id == current_user.id  # 2. ログインしているユーザーのidをcurrent_user.idで取得
      redirect_to post_images_path  # 3. 1と2のidが一致していなかった場合、 投稿一覧にリダイレクトする
      
    # @user = User.find(params[:id])
    # @user.update(user_params)
    # redirect_to user_path(@user.id)
  end
  
   
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end

