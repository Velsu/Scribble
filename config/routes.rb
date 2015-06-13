Rails.application.routes.draw do
	resources :notes
  get 'welcome/index'

  root 'welcome#index'
end
