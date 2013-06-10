Reale::Application.routes.draw do
  get "real/home"
   get "real/aboutus"
   get "real/admin_contact"
    get "real/contactmail"
    get "real/admin_stories"
  get "real/basic_view"
  
  match "/" => "real#fst"
  match ":id/adminhome" => "real#adminhome"
  match ":id/ulogin" => "real#ulogin"
  match ":id/admin_property_view" => "real#admin_property_view"
  match ":id/story" => "real#story"
  match ":id/home" => "real#home"
  match ":id/search" => "real#search"
  match ":id/mysearch" => "real#mysearch"
   match ":id/userlogin" => "real#userlogin"
   match ":id/userlog" => "real#userlog"
    match ":id/ulog" => "real#ulog"
 match "/:id/" => "real#basic_view"
 match "/:id/administrator" => "real#userlog"
 match "/:id/previewhome" => "real#previewhome"
 
 match ":id/contact" => "real#contact"
 match ":id/userlogout" => "real#userlogout"
 match ":id/logout" => "real#logout"
 match ":id/storyview" => "real#storyview"
 match ":id/aboutus" => "real#aboutus"
 
 
 get "real/ulog"
 get "real/usersignup"
  get "real/signup"
  get "real/property_add"
  get "real/property_edit"
  get "real/property_delete"
  get "real/admin_property_view"
  get "real/adminhome"
  get "real/addproperty"
  get "real/aaa"
  get "real/sub_user_validate"
  
  get "real/login"
  get "real/homesearch"
  get "real/contact"
  get "real/listing"
  get "real/about"
  get "real/story"
  get "real/story1"
  get "real/story2"
  get "real/search"
  get "real/login"
  get "real/logout"
  get "real/propertylist"
  get "real/proplist"
  get "real/mystory"
  get "real/userlogin"
  get "real/userlogout"
  get "real/storyparticular"
  get "real/storyview"
  get "real/userlogout"
  get "real/user_validate"
  get "real/mysearch"
  get "real/admin"
  get "real/adminhome_edit"
  get "real/adminstorydelete"
  #get "real/searchcheck"
  get "real/fst"
  get "real/ulog"
  get "real/senddetails"
 
  match 'real/admin' => 'real#admin', :via => :post
  match 'real/senddetails' => 'real#senddetails', :via => :put
  match 'real/usersignup' => 'real#usersignup', :via => :put
  match 'real/ulog' => 'real#ulog', :via => :put
  
  match 'real/adminhome_edit' => 'real#adminhome_edit', :via => :post
  match 'real/adminhome' => 'real#adminhome', :via => :post
   match 'real/homesearch' => 'real#homesearch', :via => :post
   
   match 'real/mysearch' => 'real#mysearch', :via => :post
   match 'real/propertylist' => 'real#propertylist', :via => :post
   match 'real/proplist' => 'real#proplist', :via => :post
   match 'real/adminstorydelete' => 'real#adminstorydelete', :via => :post
   match 'real/changepwd' => 'real#changepwd', :via => :put
   match 'real/adminlogin' => 'real#adminlogin', :via => :put
   match 'real/userlogin' => 'real#userlogin', :via => :put
   match 'real/home' => 'real#home', :via => :put
    
    match 'real/addproperty' => 'real#addproperty', :via => :put
	match 'real/deleteproperty' => 'real#deleteproperty', :via => :put
	 match 'real/addstory' => 'real#addstory', :via => :put
	  match 'real/addcontact' => 'real#addcontact', :via => :put
   match 'real/contact' => 'real#contact', :via => :post
   match 'real/contaview' => 'real#contaview', :via => :put
   match 'real/search' => 'real#search', :via => :post
   #match 'real/searchcheck' => 'real#searchcheck', :via => :put
   match 'real/story' => 'real#story', :via => :post
   match 'real/storyparticular' => 'real#storyparticular', :via => :post
   match 'real/storyview' => 'real#storyview', :via => :put
  # match 'real/residential' => 'real#residential', :via => :put
   #match 'real/' => 'real#se', :via => :put
  # match 'real/se' => 'real#se', :via => :post
  
   match "real/property_add" => "real#property_add",:via => :post
   match "real/property_delete" => "real#property_delete",:via => :post
        match "real/property_edit" => "real#property_edit",:via => :post
   match "real/admin_property_view" => "real#admin_property_view",:via => :post
  
  resources :real do
  put :residential, :on => :collection
end
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
   match ':controller(/:action(/:id))(.:format)'
end
