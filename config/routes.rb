EasyGift::Application.routes.draw do
  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'home#index'
  match 'testpage' => 'home#test'

  match 'profile'   => 'home#profile'

  match 'likes/create' => 'likes#create', :via => [:post]
  match 'comments/final' => 'comments#final', :via => [:post]


  devise_for :users, :controllers => { :registrations => 'registrations' }

  # resources :authentications
  match 'users/edit_password' => 'users#edit_password'
  match 'auth/:provider/callback' => 'authentications#create'
  match 'users/update_password' => 'users#update_password'
  match 'users/generate_new_password_email' => 'users#generate_new_password_email'
  post 'gift_requests/:id' => 'comments#create'
  # gift request  match 'gift_requests/:id' => 'comments#create', :via => [:post]
  
  resources :gift_requests

  # The priority is based upon order of creation:
  # first created -> highest priority.



  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # See how all your routes lay out with "rake routes"
end
