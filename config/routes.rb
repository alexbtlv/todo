Rails.application.routes.draw do
  root 'welcome#home'
  
  resources :todos do
  	member do
  		put :complete
  	end
  end
  
end
