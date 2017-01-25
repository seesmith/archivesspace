ArchivesSpacePublic::Application.routes.draw do

  scope AppConfig[:public_prefix] do

    match '/takedown' => 'pages#takedown'
    match '/licensing' => 'pages#licensing'
  end

end
