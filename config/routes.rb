Rails.application.routes.draw do
  devise_for :users
  
  # Calendar route
  get 'calendar', to: 'events#calendar'

  # Events resources
  resources :events do
    member do
      post 'rsvp'
      delete 'cancel_rsvp'
    end
  end

  # API endpoints for FullCalendar
  namespace :api do
    resources :events, only: [:index]
  end

  root "events#index"
end