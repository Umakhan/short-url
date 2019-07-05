Rails.application.routes.draw do
  get :response_code, to: 'check#response_code'

  root 'check#index'
end
