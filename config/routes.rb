Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
    }

    resources :home do
      collection do
        get 'users_details', to: 'home#user_show'
        get 'export_pdf', defaults: { format: :pdf }
      end

      member do
        get 'edit_user', to: 'home#edit_user'
        patch 'update_user', to: 'home#update_user'
        delete 'destroy_user', to: 'home#destroy_user'
      end

    end

  root 'home#index'

  resources :allotments do
    member do
      get 'deallot'
    end

    collection do
      get :export_pdf, defaults: { format: :pdf }
    end
  end

  resources :brands do
    collection do
      get :export_pdf, defaults: { format: :pdf }
    end
  end

  resources :categories do
    collection do
      get :export_pdf, defaults: { format: :pdf }
    end
  end

  resources :items do
    member do
      get 'allotments'
      get 'managestock', to: 'items#manage_item_stock'
      patch 'updatestock', to: 'items#update_stock'
    end

    collection do
      get :export_pdf, defaults: { format: :pdf }
    end
  end

end
