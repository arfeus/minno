Merseri::Application.routes.draw do

  resources :users do
    member do
      get :mers
    end
  end
  
  resources :sessions, only: [:new, :create, :destroy]
  
  resources :mers do
    resources :tags
    resources :comments
  end
  
  resources :mers do
    member do
      put :vote_up
      put :vote_down
    end
  end
  
  root  'welcome#search'
  match '/signup',                    to: 'users#new',                 via: 'get'
  match '/signin',                    to: 'sessions#new',              via: 'get'
  match '/signout',                   to: 'sessions#destroy',          via: 'delete'
  match '/search',                    to: 'welcome#search',            via: 'get', as: 'search'
  
  match '/printing/add_collection',   to: 'printing#add_collection',   via: 'get', as: 'add_collection'
  match '/printing/print_collection', to: 'printing#print_collection', via: 'get', as: 'print_collection' 
  match '/printing/print_all',        to: 'printing#print_all',        via: 'get', as: 'print_all'
  match '/printing/collection_email',      to: 'printing#collection_email',      via: 'get', as: 'collection_email'
  match '/printing/remove_collection',   to: 'printing#remove_collection',   via: 'get', as: 'remove_collection'
 # static pages 
  match '/help',                      to: 'welcome#help',              via: 'get', as: 'help'
  match '/about',                     to: 'welcome#about',             via: 'get'
  match '/contact',                   to: 'welcome#contact',           via: 'get'
  match '/newuser',                   to: 'welcome#newuser',           via: 'get', as: 'newuser'
  match '/welcome',                   to: 'welcome#welcome',           via: 'get', as: 'welcome'
  match '/time',                      to: 'welcome#time',              via: 'get', as: 'time'
  match '/diary',                     to: 'welcome#diary',             via: 'get', as: 'diary'
  match '/netcommunity',              to: 'welcome#netcommunity',      via: 'get', as: 'netcommunity'
  match '/inventory',                 to: 'welcome#inventory',         via: 'get', as: 'inventory'
  
  match '/users/:id/admin_on',   to: 'users#admin_on',    via: 'get', as: 'admin_on'
  match '/users/:id/admin_off',  to: 'users#admin_off',   via: 'get', as: 'admin_off'
  
  get 'tags/:tag',    to: 'mers#index',   as: :tag

  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"


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
