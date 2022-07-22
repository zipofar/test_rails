Rails.application.routes.draw do
  common_scope = ENV['RAILS_ROUTES_SCOPE']

  root 'users#index'
  get "/#{common_scope}", to: 'users#index' if common_scope.present?

  if common_scope.present?
    scope common_scope.to_sym do
      resources :users
    end
  else
    resources :users
  end
end
