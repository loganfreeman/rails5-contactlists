Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'

  get 'welcome/send_sms_message'
  post 'welcome/send_sms_message'
  # root to: 'lists#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :lists do
  	resources :tasks, except: [:show, :index]
  end
end
