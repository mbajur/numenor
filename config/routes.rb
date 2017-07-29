Rails.application.routes.draw do
  namespace :api do
    get 'current_user', action: :index, controller: :current_user
    get 'current_user/fov'
    post 'current_user/go_to'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount ActionCable.server => '/cable'

  root 'game#index'
end
