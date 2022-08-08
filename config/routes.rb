Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :blogs do
    collection do
      get :list
    end
  end

  resources :read do
    collection do
      get :upload
      post :import
    end
  end
  resources :user_names do
    collection do
      get :upload
      post :import
    end
  end
  resources :china_fortunes do
    collection do
      get :upload
      post :import
    end
  end
  resources :fortunes do
    collection do
      get :upload
      post :import
    end
  end
  resources :regions do
    collection do
      get :upload
      post :import
    end
  end
  resources :order_by_goods
  resources :my_blogs do
    collection do
      get :test
    end
  end
  resources :articals
  resources :users

  root :to => "blogs#index"

  resources :logins do
    collection do
      get :logout
    end
  end

  resources :buckets do
    resources :objects
  end

  namespace :admin do
    resources :blogs do
      collection do
        post '/blogs/upload_paste_image_to_cdn', to: 'blogs#upload_paste_image_to_cdn'
      end
    end

  end

end

