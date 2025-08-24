Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs' unless Rails.env.production? 
  mount Rswag::Api::Engine => '/api-docs'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post "/graphql", to: "graphql#execute"

  namespace :api do
    namespace :v1 do
      get 'person/:uuid/:action', to: 'person#%{action}'

      get 'resume/:id/tags/:tags/jobs', to: 'resume#jobs_by_tags'
      get 'resume/:id/:action', to: 'resume#${action}'
    end
  end
end
