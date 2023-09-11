Rails.application.routes.draw do
  resources :equipe_escolars
  resources :professors
  resources :responsavels
  resources :alunos
  resources :disciplinas
  resources :turmas
  resources :unidades
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
