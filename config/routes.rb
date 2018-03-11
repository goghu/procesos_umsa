Rails.application.routes.draw do
  resources :carreras
  resources :denuncia
  resources :excels
  resources :lista
  resources :elegidos
  resources :personas
  resources :cargos
  resources :facultades
  #devise_for :users
  root to: "facultades#index"
  devise_for :users, controllers: {
      sessions: 'users/sessions'
  }
  get '/personas/listado/', to: 'personas#listado'
  get '/elegido/seleccionar/', to: 'elegidos#seleccionar'
  get '/elegido/leerexcel/', to: 'elegidos#leerexcel'
  get '/excel/formexcel/', to: 'excels#formexcel'
  post '/excel/guardaexcel/', to: 'excels#guardaexcel'
  get '/elegido/escoger/', to: 'elegidos#escoger'
  get '/persona/solodocentes/', to: 'personas#solodocentes'
  get '/persona/solouniversitarios/', to: 'personas#solouniversitarios'
  get '/persona/soloasesores/', to: 'personas#soloasesores'
  get '/elegido/generar/', to: 'elegidos#generar'
  get '/elegido/muestra_generado/', to: 'elegidos#muestra_generado'
  get '/persona/jquery/', to: 'personas#jquery'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
