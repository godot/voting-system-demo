VotingSystemDemo::Application.routes.draw do
  root 'welcome#index'
  resource :voting
end
