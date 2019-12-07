Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'links#new'
  resources :links, only: [:create]
  get 'links/:uuid', to: 'links#show', as: :link

  match '*unmatched_route', to: 'links#redirect', via: :all
end
