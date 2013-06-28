VotingSystemDemo::Application.routes.draw do
  root 'votings#show'

  resource :voting

  namespace :admin do
    resources :votings, only: 'index'
  end

end
