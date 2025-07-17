Rails.application.routes.draw do
  devise_for :users

  # Página pública (landing page)
  root "home#index"

  # Apenas usuários logados acessam os check-ins
  authenticate :user do
    resources :check_ins
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
