Rails.application.routes.draw do
  root 'welcome#home'
  devise_for :users, path: "auth", path_names: { sign_in: 'sign_in', sign_out: 'sign_out', password: 'password', confirmation: 'verification', registration: 'register', sign_up: 'cmon_let_me_in' }
  resources :todos do
  	member do
  		put :complete
  		put :undo
  	end
  end
  
end
