Rails.application.routes.draw do
  get 'blog/likes/:post_id/destroy' => "likes#destroy"
  get 'blog/likes/:post_id/create' => "likes#create"

  get 'users/new' => "users#new"
  post 'users/new' => "users#create"

  get 'login' => "users#login_form"
  post 'login' => "users#login"
  get 'logout' => "users#logout"

  get 'contacts/new'
  get 'contacts/create'
  get 'blog' => "posts#index"

  get 'blog/new' => "posts#new"

  post 'blog' =>"posts#create"

  get 'blog/:id' => "posts#show"
  get 'blog/:id/destroy' => "posts#destroy"
  get 'blog/:id/edit' => "posts#edit"
  post 'blog/:id/update' => "posts#update"



  get 'access' => "top#access"
  get 'lesson' => "lesson#index"
  get 'profile' => "top#profile"
  get 'users/show'

  root 'top#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
