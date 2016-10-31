Rails.application.routes.draw do
  # routes
  # HTTP VERBS: get, post, put, patch, delete
  # verb 'url/path' => 'controller#action'
  get 'students'      => 'students#index'
  get 'students/:id'  => 'students#show', as: 'student', id: /\d+/ #<= constraints: http://guides.rubyonrails.org/routing.html#segment-constraints
  # same as:
  # resources 'students', only: [:index, :show]

  root 'students#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
