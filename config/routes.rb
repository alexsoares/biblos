ActionController::Routing::Routes.draw do |map|
  map.resources :audiovisuais
  map.resources :audiovisuais
  map.resources :livros
  map.resources :localizacaos
  map.resources :identificacaos
  map.resources :editoras
  map.resources :areas
  map.resources :generomidias
  map.resources :assuntos
  map.resources :tipos

  map.resources :informativos
  map.resources :unidades, :collection => {:print_all => :get}
  map.resources :users
  map.resource :session
  map.resources :roles_users
  map.desconectar '/chat/desconectar', :controller => 'chats', :action => 'desconectar'  
  #map.connect '/homes/acertar_online_users', :controller => 'homes', :action => 'acertar_online_users'
  map.resources :homes
  map.resource :password
  #map.connect '/estagiarios/rel_ponto/:year/:month', :controller => 'estagiarios', :action => 'rel_ponto', :year => nil, :month => nil
  #map.connect '/estagiarios/carga_horaria/:estagiario_id_equals/:year/:month', :controller => 'estagiarios', :action => 'carga_horaria', :year => nil, :month => nil
  map.root :controller => 'homes', :action => 'index'

  map.geo "/geos/geo/:id", :controller => "geos", :action => "geo"

  map.regras '/regras', :controller => 'livros', :action => 'regras'

  # map.cons_titulo_livro '/cons_titulo_livro', :controller => 'livros', :action => 'cons_titulo_livro'
  map.cons_titulo_livro '/cons_titulo_livro', :controller => 'livros', :action => 'titulo'
  map.cons_area_livro '/cons_area_livro', :controller => 'livros', :action => 'cons_area_livro'
  map.cons_assunto_livro '/cons_assunto_livro', :controller => 'livros', :action => 'assunto'
  map.cons_isbn_livro '/cons_isbn_livro', :controller => 'livros', :action => 'cons_isbn_livro'
  map.cons_unidade_livro'/cons_unidade_livro', :controller => 'livros', :action => 'cons_unidade_livro'

  map.cons_faixaetaria_jogo '/cons_faixaetaria_jogo', :controller => 'jogos', :action => 'cons_faixaetaria_jogo'
  map.cons_titulo_jogo '/cons_titulo_jogo', :controller => 'jogos', :action => 'cons_titulo_jogo'
  map.cons_unidade_jogo'/cons_unidade_jogo', :controller => 'jogos', :action => 'cons_unidade_jogo'

  map.cons_tipo_mapa '/cons_tipo_mapa', :controller => 'mapas', :action => 'cons_tipo_mapa'
  map.cons_titulo_mapa '/cons_titulo_mapa', :controller => 'mapas', :action => 'cons_titulo_mapa'
  map.cons_unidade_mapa'/cons_unidade_mapa', :controller => 'mapas', :action => 'cons_unidade_mapa'

  map.cons_tipo_pe'/cons_tipo_pe', :controller => 'periodicos', :action => 'cons_tipo_pe'
  map.cons_periodicidade_pe'/cons_periodicidade_pe', :controller => 'periodicos', :action => 'cons_periodicidade_pe'
  map.cons_unidade_pe'/cons_unidade_pe', :controller => 'periodicos', :action => 'cons_unidade_pe'
  map.cons_titulo_pe '/cons_titulo_pev', :controller => 'periodicos', :action => 'cons_titulo_pe'

  map.cons_genero_av '/cons_genero_av', :controller => 'audiovisuais', :action => 'cons_genero_av'
  map.cons_unidade_av '/cons_unidade_av', :controller => 'audiovisuais', :action => 'cons_unidade_av'
  map.cons_titulo_av '/cons_titulo_av', :controller => 'audiovisuais', :action => 'cons_titulo_av'
  map.regras_av '/regras_av', :controller => 'audiovisuais', :action => 'regras'

  map.titulo '/titulo', :controller => 'audiovisuais', :action => 'titulo'

  map.c_uni_end '/c_uni_end', :controller => 'unidades', :action => 'por_endereco'
  map.c_uni_tp '/c_uni_tp', :controller => 'unidades', :action => 'consultatipo'
  map.c_uni_uni '/c_uni_uni', :controller => 'unidades', :action => 'consulta'

  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.reset_password '/reset_password/:id', :controller => 'passwords', :action => 'edit'
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'

end
