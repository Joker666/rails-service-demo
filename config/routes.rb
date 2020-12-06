Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  concern :api_v1 do
      post '/user/create', action: :create, controller: 'user'
  end

  scope :api do
    namespace :v1 do
      concerns :api_v1
    end
  end

end
