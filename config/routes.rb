Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # resources :git_board, only: [:post]
  # post '/git_board', to: 'git_board#create'
  resources :commits, only: [:create, :index]
end
