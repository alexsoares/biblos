# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111010173609) do

  create_table "areas", :force => true do |t|
    t.string   "area"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assuntoitens", :force => true do |t|
    t.integer  "assunto_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assuntos", :force => true do |t|
    t.string   "assunto"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "audiovisuais", :force => true do |t|
    t.integer  "genero_id"
    t.integer  "localizacao_id"
    t.string   "tomboS"
    t.string   "tomboL"
    t.string   "titulo"
    t.string   "subtitulo"
    t.string   "producao"
    t.string   "produtor"
    t.datetime "dataporducao"
    t.string   "localproducao"
    t.string   "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "documentos", :force => true do |t|
    t.string   "titulo"
    t.text     "descricao"
    t.integer  "c_externo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "editoras", :force => true do |t|
    t.string   "nome"
    t.string   "cidade"
    t.string   "pais"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "generomidias", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "identificacaos", :force => true do |t|
    t.string   "codigo"
    t.string   "titulo"
    t.string   "subtitulo"
    t.string   "autor"
    t.string   "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "informativos", :force => true do |t|
    t.text     "mensagem"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "livros", :force => true do |t|
    t.integer  "assuntoiten_id"
    t.integer  "identificacao_id"
    t.integer  "area_id"
    t.integer  "editora_id"
    t.string   "tomboS"
    t.string   "tomboL"
    t.string   "colecao"
    t.string   "edicao"
    t.datetime "dataedicao"
    t.string   "localedicao"
    t.string   "resumo"
    t.string   "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "localizacaos", :force => true do |t|
    t.integer  "unidade_id"
    t.integer  "livro_id"
    t.string   "localguardado"
    t.string   "aquisicao"
    t.datetime "dataaquisicao"
    t.string   "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "online_users", :force => true do |t|
    t.string   "username"
    t.date     "last_seen"
    t.boolean  "online"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "chat_session"
  end

  create_table "roles", :force => true do |t|
    t.string "name"
  end

  create_table "roles_users", :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "roles_users", ["role_id"], :name => "index_roles_users_on_role_id"
  add_index "roles_users", ["user_id"], :name => "index_roles_users_on_user_id"

  create_table "tipos", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "unidades", :force => true do |t|
    t.integer  "tipo_id",                    :null => false
    t.integer  "regiao_id"
    t.string   "nome"
    t.string   "endereco"
    t.integer  "num"
    t.string   "complemento"
    t.string   "bairro"
    t.string   "cidade"
    t.string   "fone"
    t.string   "email"
    t.string   "diretor"
    t.string   "coordenador"
    t.string   "obs"
    t.integer  "estagiarioM", :default => 0
    t.integer  "estagiarioV", :default => 0
    t.integer  "estagiarioN", :default => 0
    t.integer  "estagiarioE", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.integer  "unidade_id"
    t.string   "password_reset_code"
  end

end
