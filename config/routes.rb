Rails.application.routes.draw do
  mount API::Base => '/api'
  mount GrapeSwaggerRails::Engine => '/apidoc'
  get :response_code, to: 'check#response_code'

  root 'check#index'
end
