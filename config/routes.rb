Rails.application.routes.draw do
  resources :casas
  #resources :produtos, only: [:new, :create, :delete] #outra forma de gerar urls automaticamente
  post "/bandas" => "produtos#create"
  patch "/bandas/:id" => "produtos#update_banda"
  get "bandas/cadastrar" => "produtos#new_banda"
  get "/bandas/busca" => "produtos#bandas_busca"
  delete "/bandas/:id" => "produtos#delete", as: :banda
  get "/bandas/:id" => "produtos#update", as: :editbanda
  root "produtos#index" #Link para raiz do site
end
