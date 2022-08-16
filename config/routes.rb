Rails.application.routes.draw do
  namespace :api do
    get 'health', to: 'api#health'
    resources :weather, only: %i[current by_tyme] do
      collection do
        get :current
        get :by_time
        resources :historical, only: %i[min max avg] do
          collection do
            get :min
            get :max
            get :avg
          end
        end
      end
    end
  end
end
