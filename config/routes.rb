Rails.application.routes.draw do
  resources :artists, only: [:index, :show]
end
