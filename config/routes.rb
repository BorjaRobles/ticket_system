TicketSistem::Application.routes.draw do  
  
  #Esta ruta no se puede modificar con un member ??  
  get "/tickets/:ticket_id/:estado" => "tickets#index", :as => "asignar_estado" 
  
  resources :sessions, :comments
  
  resources :users do 
    resources :tickets do 
      resources :comments  
    end
  end

  get "legalidad"=>"static_pages#legalidad", :as=>'static_pages_legalidad'
  get "privacidad"=>"static_pages#privacidad", :as=>'static_pages_privacidad'
  
  resources :tickets do
    get '/buscador', :on=> :collection 
    get 'asignar_estado', :on => :member 
  end
  
  
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  get "/contact_form" => "contact#show"
  post "/contact_form" => "contact#show"
  root :to => 'Home#index'
end

