Rails.application.routes.draw do
  get 'blog' => "posts#index"

  get 'blog/new' => "posts#new"
  post 'blog' =>"posts#create"
  get 'blog/:id' => "posts#show"
  get 'blog/:id/edit' => "posts#edit"

  get 'access' => "top#access"
  get 'lesson' => "lesson#index"
  get 'profile' => "top#profile"
  get 'users/show'

  get 'contact' => "contact#index"
  post 'contact' => "contact#confirm"
  root 'top#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
