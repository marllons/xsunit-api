Rails.application.routes.draw do
  apipie
  resources :report_survivors
  resources :genders
  resources :survivors do
    resource :gender, only: [:show]
    resource :gender, only: [:show], path: 'relationships/gender'

    resource :location, only: [:show]
    resource :location, only: [:show], path: 'relationships/location'

    resource :report_survivor, only: [:show, :update]

    resource :report_survivor, only: [:show, :update] do
      member do
        get ':id', to: 'report_survivors#report'
        # get :id
      end
    end

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
