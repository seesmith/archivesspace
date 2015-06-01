ArchivesSpace::Application.routes.draw do
  match 'assets/*path' => 'assets#show', :via => [:get]
end
