Rails.application.routes.draw do

  #ユーザー側のDeviseルーティング
  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'}

  #管理者側のDeviseルーティング
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"}

  #管理者側のルーティング
  namespace :admin do
    resources :users, only: [:index, :edit, :update]

  end

  #ユーザー側のルーティング
  namespace :public, path: "" do
    get '/' => 'homes#top'
    resources :friends, only: [:index, :edit, :update, :destroy, :new, :create] do
      collection do
        get 'search'
      end
    end
    resources :users, only: [:show, :edit, :update] do
      collection do
        get 'withdraw'
      end
    end
  end
end
