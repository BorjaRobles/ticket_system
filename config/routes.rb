TicketSistem::Application.routes.draw do  
  resources :comments
  
  get "/tickets/:ticket_id/:estado" => "tickets#index", :as => "asignar_estado" 
  
  resources :tickets
  resources :sessions
  resources :users do 
    resources :tickets do 
      resources :comments  
    end
  end

  get "static_pages/legalidad"
  get "static_pages/privacidad"  
  
  get "/buscador" => "tickets#buscador", :as => "buscar_ticket"
  get "/tickets" => "tickets#index", :as => "ver_todos"
  get "/ticket/:id" => "tickets#show", :as => 'mostrar_ticket'
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  match "/session" => "sessions#show", :as => 'sesion'
  get "/contact_form" => "contact#show"
  post "/contact_form" => "contact#show"
  match "/registro" => "home#sigin"
  root :to => 'Home#index'
end

