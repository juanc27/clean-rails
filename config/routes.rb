Rails.application.routes.draw do
  # restful
  resources :tests, only: %i[index create] do
    member do
      get :show
      put :update
      delete :destroy
    end
  end

  resources :polls, only: %i[index create] do
    member do
      get :show
      put :update
      delete :destroy
    end
  end

  # only gets and posts
  # resources :tests, only: %i[index create] do
  #   member do
  #     get :show
  #     post :update
  #     post :delete
  #   end
  # end
end
