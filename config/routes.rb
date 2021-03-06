LootApp::Application.routes.draw do
  get "products/view"
  get "products/new"
  get "password_resets/new"
  get "sessions/new"
  get "static_pages/home"
  get "static_pages/help"
  # get "transactions/new"

  resources :sessions
  resources :password_resets
  resources :email_activations
  resources :bankaccts
  # post '/bankaccts/:id' => 'bankaccts#addbank'
  post "/bankaccts/new" => 'bankaccts#addbank'
  # post "settings/addpaymentmethod", :to => "users/registrations#add_payment_method"


  resources :products do
      resources :photos
      get :pics
  end
  resources :photos
  resources :requests do
    collection do
      get :activate
    end
  end
  resources :invitations do
    collection do
      get :accept_referral
    end
  end

  resources :users do
    collection do 
      get :accept_invitation
    end 
  end

  resources :transactions
  
  root to: 'static_pages#home'
  match "sign_up",      to: "users#new"
  match '/help',        to: 'static_pages#help'
  match '/log_in',      to: 'sessions#new'
  match '/log_out',     to: 'sessions#destroy'
  match '/remove_item', to: 'products#destroy'

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

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
