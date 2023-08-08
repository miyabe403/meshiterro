Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users  # devise_for :users は、devise を使用する際に URL として users を含むことを示しています。
  
  get 'post_images/new'
  get 'post_images/index'
  get 'post_images/show'
  
  resources :post_images, only: [:new, index, :show] # resources メソッドは、ルーティングを一括して自動生成してくれる機能 onlyオプションを使用することで、生成するルーティングを限定することができます。
  
  get '/homes/about' => 'homes#about', as: 'about'  # 名前付きルート as:オプションを追加「'homes#about'の設定を、aboutとして利用できる」
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
