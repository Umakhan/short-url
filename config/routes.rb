Rails.application.routes.draw do
  mount API::Base => '/api'
  mount GrapeSwaggerRails::Engine => '/apidoc'
  get :response_code, to: 'check#response_code'
  get :generate_short_url, to: 'urls#generate_short_url'
  resources :urls, only: :index

  root 'check#index'
end
