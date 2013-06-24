ChildCareApp::Application.routes.draw do
 # resources :parents
 # resources :sitters
 # resources :jobs
 # resources :parent_child_details
 # resources :sitter_parent_links
 # resources :special_instructions
  
  match '/registerParent' => 'parents#create', :via => :post
  match '/updateParent' => 'parents#update', :via => :post
  match '/parents' => 'parents#index', :via => :get
  match '/getParent' => 'parents#show', :via => :post
  match '/deleteParent' => 'parents#destroy', :via => :post

  match '/registerSitter' => 'sitters#create', :via => :post
  match '/updateSitter' => 'sitters#update', :via => :post
  match '/sitters' => 'sitters#index', :via => :get
  match '/getSitter' => 'sitters#show', :via => :post
  match '/deleteSitter' => 'sitters#destroy', :via => :post
  
  match '/createJob' => 'jobs#create', :via => :post
  match '/updateJob' => 'jobs#update', :via => :post
  match '/getJob' => 'jobs#show', :via => :post
  match '/cancelJob' => 'jobs#destroy', :via => :post

  match '/addSitter' => 'sitter_parent_links#create', :via => :post
  match '/removeSitter' => 'sitter_parent_links#destroy', :via => :post

  match '/addChild' => 'parent_child_details#create', :via => :post
  match '/updateChild' => 'parent_child_details#update', :via => :post
  match '/getChild' => 'parent_child_details#show', :via => :post

  match '/addInstruction' => 'special_instructions#create', :via => :post
  match '/UpdateInstruction' => 'special_instructions#update', :via => :post
  match '/getInstruction' => 'special_instructions#show', :via => :post
  
  match '/acceptJob' => 'accepted_jobs#create', :via => :post
  
  match '/login' => 'login_credentials#login', :via => :post
  match '/logout' => 'login_credentials#logout', :via => :post
  match '/changePassword' => 'login_credentials#change_password', :via => :post


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
