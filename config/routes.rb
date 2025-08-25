# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  post "/graphql", to: "graphql#execute"

  namespace :api do
    namespace :v1 do
      get 'person/:uuid/:action', to: 'person#%{action}'

      get 'resume/:id/tags/:tags/jobs', to: 'resume#jobs_by_tags'
      get 'resume/:id/:action', to: 'resume#${action}'
    end
  end
end
