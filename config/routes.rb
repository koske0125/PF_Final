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
    resources :friends, only: [:index, :edit, :show, :update, :destroy] do
      collection do
        get :search
      end
    end
  resources :boards, except: [:new, :create]
  end

  #ユーザー側のルーティング
  namespace :public, path: "" do
    get '/' => 'friends#index'
    get '/about' => "homes#about"
    resources :clubs, except: [:new] do
      resources :club_members, only: [:create, :destroy]
      resources :club_boards, only: [:create, :show]
    end
    resources :club_board_comments, only: [:create]
    resources :rooms, only: [:create, :index, :new] do
      resources :messages, only: [:create, :index]
    end
    resources :boards, only: [:index, :create, :show] do
      resources :board_comments, only: [:create]
    end
    resources :friends do
      collection do
        get :search
      end
    end
    resources :contacts, only: [:new, :create] do
      collection do
        post 'confirm'
        post 'back'
      end
    end
    resources :users, only: [:show, :edit, :update] do
      collection do
        get 'withdraw'
        get 'clubs'
      end
      resource :relationships, only: [:create, :destroy]
        get :followings, on: :member
        get :followers, on: :member
    end
  end
end
