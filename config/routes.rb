Rails.application.routes.draw do
  
  
  scope :path => "(:locale)", :locale => /en|it/ do
    devise_for :users
    
    devise_scope :user do
      authenticated :user do
        root 'policies#index', as: :authenticated_root
      end
      
      unauthenticated do
        root 'devise/sessions#new', as: :unauthenticated_root    
      end
    end  
  end
  
 
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
  
    
  
    scope :path => "(:locale)", :shallow_path => "(:locale)", :locale => /en|it/ do
      resources :users, only: [:index, :show, :destroy], :shallow => true do#only: [:index, :show, :destroy],
        resources :policyholders, only: :new
      end  
    end
  
    scope :path => "(:locale)", :shallow_path => "(:locale)", :locale => /en|it/ do
      resources :policyholders, :shallow => true do
        resources :policies
      end
    end
   
    scope :path => "(:locale)", :shallow_path => "(:locale)", :locale => /en|it/ do
      resources :policies, :shallow => true do
        resources :accidents
        resources :fvplants
      end
    end
   
    scope :path => "(:locale)", :locale => /en|it/ do
      resources :accidents
      resources :fvplants
      resources :accident_steps
    end
   
    #Mail Form
    #resources :contacts
    #match '/contacts',     to: 'contacts#new',   via: 'get'
    #resources "contacts", only: [:new, :create]
   
   
    #Route that posts 'Create Policy' form
    post '/policies/create_policy'
    
    
    #get '*path', to: redirect("/#{I18n.default_locale}/%{path}"), constraints: lambda { |req| !req.path.starts_with? "/#{I18n.default_locale}/" }
    #get '', to: redirect("/#{I18n.default_locale}/policies"
    
    get '/:locale' => 'policies#index'
    root :to => "policies#index" 
    
    
   
  end
