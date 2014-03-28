Lookshelf::Application.routes.draw do
  get "book/new"
  get "session/new"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  
 get 'auth/:provider/callback', to: 'session#fbcreate'

 get 'auth/failure', to: redirect('/')
 get 'signout', to: 'session#destroy', as: 'signout'  
  
  get "session/new"=>"session#new",:as=>:user_login
  get "session/destroy"=>"session#destroy",:as=>:user_logout


  post "session/create"=>"session#create",:as=>:create_session
  get "user/user_home"=>"user#user_home",:as=>:user_home
   get "user/notification"=>"user#notification",:as=>:user_notification
   post "user/update_notification"=>"user#update_notification",:as=>:update_notification
   
  get "user/user_account"=>"user#user_account",:as=>:user_account
    post "user/update"=>"user#update",:as=>:update_user


  get "user/borrower_page"=>"user#borrower_page",:as=>:borrower_page
  get "user/lander_page"=>"user#lander_page",:as=>:lander_page

  post "user/create_user"=>"user#create_user"  ,:as=>:create_user
  post "user/check_username"=>"user#check_username"
    
  get  "book/new"=>"book#new",:as=>:new_book
  get  "book/add_cate"=>"book#add_cate",:as=>:add_cate
    get  "book/user_book"=>"book#user_book",:as=>:user_book
        get  "book/all_book"=>"book#all_book",:as=>:all_book



  post "book/create"=>"book#create",:as=>:add_book
  post "book/create_cate"=>"book#create_cate",:as=>:create_cate

  post "book/search_book"=>"book#search_book"
    post "book/search_book_by_cate"=>"book#search_book_by_cate"

  
  
  get "book/book_request/:id"=>"book#book_request" ,:as=>:book_request
  get "book/book_response/:id"=>"book#book_response" ,:as=>:book_response
       

  post "book/create_book_request"=>"book#create_book_request" ,:as=>:create_book_request
  post "book/create_book_response"=>"book#create_book_response" ,:as=>:create_book_response


  root 'home#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
