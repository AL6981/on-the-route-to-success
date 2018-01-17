Rails.application.routes.draw do
  resources :questions, only: [:index, :new, :show, :create, :edit, :update, :destroy] do
    resources :comments, only: [:index, :new, :create]
  end


  root 'questions#index'

end
