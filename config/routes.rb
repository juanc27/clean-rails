Rails.application.routes.draw do
  # restful
  resources :tests, only: %i[index create] do
    member do
      get :show
      put :update
      delete :destroy
    end
  end
end
