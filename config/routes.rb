Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'

  resources :posts
  resources :comments
 #  scope shallow_prefix: "sekret" do
	#   resources :posts do 
	#   	resources :comments, shallow: true
	#   end
	# end
	# resources :comments, only: [:show, :edit, :update, :destroy]

	# concern :commentable do
	# 	resources :comments
	# end

	# resources :posts, concerns: :commentable 

	resources :tests

# ______________________________________
	# concern :testable do
	# 	resources :tests
	# end
 #  namespace :admin do
 #  	concerns :testable
 #  end
# ______________________________________

  # scope module: :admin do
  # 	resources :tests
  # end

  # scope 'admin' do 
  # 	resources :tests
  # end

  # resources :posts do 
  # 	resources :comments
 	# end 	


  # resources :posts do
  # 	member do
	 #  	post 'profile'
	 #  end
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
