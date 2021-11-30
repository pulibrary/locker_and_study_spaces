# frozen_string_literal: true

Rails.application.routes.draw do
  resources :locker_violations
  resources :study_room_assignments
  resources :study_rooms
  root 'locker_applications#new'

  resources :locker_applications do
    get 'awaiting_assignment', on: :collection
    member do
      get 'assign'
    end
  end
  resources :locker_assignments, except: :new
  resources :lockers

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new', as: :new_user_session
    get 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
