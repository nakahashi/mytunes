Rails.application.routes.draw do
  devise_for :users
  root "home#index"

  resources :libraries, except: [:destroy, :update] do
    resources :tracks, only: [:index, :show]
  end

  # resourcesだとdestroyパスに名前がつかないじゃないか！
  # 自分でつけてみる。
  delete 'libraries/:id', to: 'libraries#destroy', as: :destroy_library
  patch 'libraries/:id', to: 'libraries#update', as: :update_library
end
