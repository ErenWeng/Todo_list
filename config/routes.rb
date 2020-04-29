Rails.application.routes.draw do
  resources :lists do
    resources :items do
      member do
        patch :complete, :incomplete
      end
    end
  end 



  root "lists#index"
end
