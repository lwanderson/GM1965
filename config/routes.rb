ActionController::Routing::Routes.draw do |map|
  map.resources :registrations

  map.resources :class_members

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller

  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"
  map.root :controller => "gm65"

  # See how all your routes lay out with "rake routes"

  map.connect 'gm65index', :controller => 'gm65', :action => 'gm65index'
  map.connect 'register', :controller => 'gm65', :action => 'register'
  map.connect 'reg_error', :controller => 'gm65', :action => 'reg_error'
  map.connect 'member_randr', :controller => 'gm65', :action => 'member_randr'
  map.connect 'members', :controller => 'gm65', :action => 'members'
  map.connect 'reunions', :controller => 'gm65', :action => 'reunions'
  map.connect 'memoriam', :controller => 'gm65', :action => 'memoriam'
  map.connect 'thanks', :controller => 'gm65', :action => 'thanks'
  map.connect 'signin', :controller => 'gm65', :action => 'signin'

  map.connect 'login', :controller => 'login', :action => 'login'
  map.connect 'logout', :controller => 'login', :action => 'logout'

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
