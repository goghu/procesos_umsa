Rails.application.routes.draw do
  resources :egrupals
  resources :impresos
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
  get '/persona/jquery/', to: 'personas#jquery'
  get '/persona/solodocentes/', to: 'personas#solodocentes'
  get '/persona/solouniversitarios/', to: 'personas#solouniversitarios'
  get '/persona/soloasesores/', to: 'personas#soloasesores'
  get '/excel/formexcel/', to: 'excels#formexcel'
  post '/excel/guardaexcel/', to: 'excels#guardaexcel'
  get '/elegido/seleccionar/', to: 'elegidos#seleccionar'
  get '/elegido/leerexcel/', to: 'elegidos#leerexcel'
  get '/elegido/generar/', to: 'elegidos#generar'
  get '/elegido/escoger/', to: 'elegidos#escoger'
  get '/elegido/muestra_generado/', to: 'elegidos#muestra_generado'

  get '/persona/usuario/', to: 'personas#usuarios'

  get '/persona/fallo', to: 'personas#fallo'
  post '/persona/guarda_fallo/', to: 'personas#guarda_fallo'
  get '/persona/bs_ci_ajax/:ci', to: 'personas#bs_ci_ajax'
  get '/persona/imprime/:id_persona', to: 'personas#imprime'

  get '/persona/emisioncertf/', to: 'personas#emisioncertf'
  post '/persona/guarda_emision/', to: 'personas#guarda_emision'
  get '/persona/bu_ci_ajax/:ci', to: 'personas#bu_ci_ajax'
  get '/persona/imprimir1/:id_persona', to: 'personas#imprimir1'

  get '/persona/emisiongrupal/', to: 'personas#emisiongrupal', as: 'emision_grupal'
  post '/persona/guarda_emisiongrupal/', to: 'personas#guarda_emisiongrupal'
  get '/persona/bg_ci_ajax/:ci', to: 'personas#bg_ci_ajax'
  get '/persona/imprimir2/:id_persona', to: 'personas#imprimir2'
  get '/persona/guarda_id/:id_persona/:ul_imp', to: 'personas#guarda_persona_id'
  get '/persona/mostrar/', to: 'personas#mostrar_antes_imprimir'

  get '/denuncias/busca_ci_ajax/:ci', to: 'denuncia#busca_ci_ajax'
  get '/denuncias/impresion/:id_persona', to: 'denuncia#impresion'

  get '/persona/guarda_grupal/:id_persona/:cod_impresion', to: 'personas#guarda_grupal'
  get '/persona/muestra_grupal/:cod_impresion', to: 'personas#muestra_grupal'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
