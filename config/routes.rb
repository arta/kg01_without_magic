Rails.application.routes.draw do
  # ROUTES:
  # HTTP VERBS: get, post, put, patch, delete
  # verb 'url/path' => 'controller#action'

  # SHOW Routes:
  get 'students'      => 'students#index'
  get 'students/:id'  => 'students#show', as: 'student', id: /\d+/ #<= constraints: http://guides.rubyonrails.org/routing.html#segment-constraints
  # same as:
  # resources 'students', only: [:index, :show]

  # CREATE Routes:
  get 'students/new'  => 'students#new', as: 'new_student'
  post 'students'     => 'students#create'

  # UPDATE Rotes:
  get 'students/:id/edit' => 'students#edit', as: 'edit_student', id: /\d+/
  patch 'students/:id'    => 'students#update'

  root 'students#index'
end
