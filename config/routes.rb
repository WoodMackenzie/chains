Chains::Application.routes.draw do

  resources :project_categories

  resources :project_detail_numericals

  resources :project_detail_strings

  resources :projects

  get "registrations/new"
  get "registrations/create"

  resources :location_granularities

  resources :measure_types

  resources :units_of_measures

  resources :commodities

  resources :throughput_metrics

  resources :throughputs

  resources :unit_types

  resources :roles

  resources :role_assignments

  resources :organizations

  resources :comments

  resources :names

  resources :processing_units

  if Rails.env.production?
    devise_for :users, :controllers => {:registrations => "registrations"}
  else
    devise_for :users
    #Below line is for testing purposes, to see if this piece of code omits new user registrations from program.
    # devise_for :users, :controllers => {:registrations => "registrations"}
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # Established this root after installing Devise
  # root 'welcome#index'
  root :to => "welcome#index"

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
