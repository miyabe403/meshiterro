Rails.application.routes.draw do
  devise_for :users  # devise_for :users は、devise を使用する際に URL として users を含むことを示しています。
  root to: 'homes#top'
  get '/homes/about' => 'homes#about', as: 'about'  # 名前付きルート as:オプションを追加「'homes#about'の設定を、aboutとして利用できる」
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do # resources メソッドは、ルーティングを一括して自動生成してくれる機能 onlyオプションを使用することで、生成するルーティングを限定することができます。
    resources :post_comments, only: [:create] # コメントは、投稿画像に対してコメントされます。このため、post_commentsは、post_imagesに結びつきます。 以下のように親子関係になります。
  end
  resources :users, only: [:show, :edit, :update] # resourcesとonlyを使って、show, editのアクションのみ追加 
end