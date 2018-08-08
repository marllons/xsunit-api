Rails.application.routes.draw do
  apipie
  resources :report_survivors, only: [:show, :index, :update]
  resources :genders
  resources :survivors do
    resource :gender, only: [:show]
    resource :location, only: [:show]
    resource :report_survivor, only: [:show] do
      member do
        get ':id', to: 'report_survivors#report'
      end
    end

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
