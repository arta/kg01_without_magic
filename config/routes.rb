Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # ROUTES:
  # HTTP VERBS: get, post, put, patch, delete
  # verb 'url/path' => 'controller#action'

  # SHOW Routes:
  get 'students'      => 'students#index'
  get 'students/:id'  => 'students#show', as: 'student', id: /\d+/ #<= constraints: http://guides.rubyonrails.org/routing.html#segment-constraints
  # same as:
  # resources 'students', only: [:index, :show]

  root 'students#index'
end
