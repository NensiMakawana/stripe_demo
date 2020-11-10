Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  devise_scope :user do
    authenticated  do
      root to: 'home#index', as: 'home'
    end

    unauthenticated do
      root to: 'devise/sessions#new', as: 'login'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
