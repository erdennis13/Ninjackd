Rails.application.routes.draw do
  resources :dailytips

  resources :weeklybits

  resources :weeklyplans

  resources :warmworks

  resources :warmups

  resources :comments

  resources :likes

  resources :histories

  resources :subscriptions

  resources :workoutbits

  resources :workouts 
  resources :exercises

  devise_for :users
  root 'pages#home'
  get "about" => "pages#about"
  get "profile" => "subscriptions#profile"
  get "currentWorkout" => "histories#currentWorkout"
  get "completedWorkout" => "pages#completedWorkout"
  get "workoutHistory" => "pages#workoutHistory"
  get "admin" => "workouts#admin"
  get "detailedHistory" => "pages#detailedHistory"
  get "findWorkout" => "workouts#findWorkout"

  get "add_weekly_subscription" => "workouts#add_weekly_subscription"
  post "add_weekly_subscription" => "workouts#add_weekly_subscription"

  get "welcome" => "pages#welcome"
  get "cancel" => 'pages#cancel'
  get 'purchase' => 'pages#purchase'

  get 'paypal/checkout', to: "pages#paypal_checkout"
  get 'cancel_account', to: "pages#cancel_account"
  post 'cancel_account', to: 'pages#cancel_account'
  get 'request_payment_process', to: "pages#request_payment_process"
  post 'request_payment_process', to: "pages#request_payment_process"

  get 'mark_all_complete', to: 'histories#mark_all_complete'
  post 'mark_all_complete', to: 'histories#mark_all_complete'

  get 'add_new_user', to: "workouts#add_new_user"
  post 'add_new_user', to: "workouts#add_new_user"

  get "tipofday" => "dailytips#tipofday"

  #get "category" => "workouts#category"
  #post "category" => "workouts#category"
  #get '/workouts/:id/assign', to: 'workouts#assign', as: 'assign'

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
