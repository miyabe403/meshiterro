Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get '/homes/about' => 'homes#about', as: 'about'  # 名前付きルート as:オプションを追加「'homes#about'の設定を、aboutとして利用できる」
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
