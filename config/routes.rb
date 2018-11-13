Rails.application.routes.draw do
  get "mega_assembles", :to => "assembly_nums#mega_assemble", :as => 'mega_assembles'
  resources :assembly_nums
  resources :next_battles
  resources :blocks
  resources :partnerships
  resources :intentions
  get "reward/graph", :to => "rewards#graph", :as => 'reward_graphs'
  resources :rewards
  resources :conditions
  resources :regalia
  resources :specs
  resources :statuses
  resources :markets
  resources :items
  resources :proper_names
  resources :names
  get 'top_page/privacy'
  root 'top_page#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
