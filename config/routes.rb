Rails.application.routes.draw do
  get 'favorites/index'
  devise_for :users
  # get 'friends/index'
  # get 'friends/show'
  # get 'friends/edit'
  # get 'friends/new'
  resources :blogs
  get '/students',to: "students#index"
  post '/students',to: 'students#create'
  get '/students/new',to: "students#new"
  get '/students/:id/edit',to: "students#edit", as: "edit_student"
  get '/students/:id' => "students#show", as: :student
  get '/student_destroy/:id',to: "students#destroy", as: :student_destroy
  get 'student_details/:id' => "students#student_details", as: :details
  post 'create' => 'comments#create'
  get '/comments/:id', to: 'comments#remove'
  get '/favorites', to: 'favorites#index'
  # resources :students
  # get '/students/:id',to: "students#show"
  post '/students/:id', to: "students#update"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :posts
  # Defines the root path route ("/")
  root "students#index"
  

  resources :products do 
    resources :reviews
    get 'add_favorite'
    get 'remove_favorite'
  end
  
  resources :friends
end
