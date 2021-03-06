Rails.application.routes.draw do
  
  
  mount Ckeditor::Engine => '/ckeditor'
  root 'list_event_master#index'

  #get 'list_event_master/show'
  resources :list_event_master

  resources :event_category_mappings

  resources :sub_categories

  resources :categories

  resources :event_masters do
    get "populate_subcategory"
    resources :event_ticket_types  
  end

  devise_for :users
  resources :users

  
  resources :status_masters
  resources :bank_details #  devise_scope :user do
#  get "sign_in", :to=> "devise/sessions#new"
#  end
#  root :to=> redirect("devise/sessions#new")
# devise_scope :user do
#   authenticated :user do
#     root 'event_masters#index', :as=> :authenticated_root
#   end

#   unauthenticated do
#     root 'devise/sessions#new', :as=> :unauthenticated_root
#   end
# end


get '/sign_out' => 'users/sessions#destroy'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
