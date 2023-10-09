Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  root 'home#index'
  resources :tarefas
  resources :disciplinas do
    resources :tarefas, only: [:index, :new, :create]
  end
  resources :disciplinas do
    resources :tarefas
  end
  
  resources :tarefas do
    get 'calendar_events', on: :collection
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
