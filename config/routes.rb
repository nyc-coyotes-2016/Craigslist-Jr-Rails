Rails.application.routes.draw do
  resources :categories do
    resources :articles, except: [:index]
  end
  # root 'index' => 'questions#index'
end
