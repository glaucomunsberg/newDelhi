# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140322025948) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "atividades_registradas", force: true do |t|
    t.string   "descricao"
    t.datetime "dt_cadastro", default: "now()"
  end

  create_table "cenas", force: true do |t|
    t.string   "descricao"
    t.integer  "grupo_atividade_id"
    t.date     "dt_ocorrencia",                  default: "now()"
    t.string   "estaativo",            limit: 1, default: "S"
    t.datetime "dt_cadastro",                    default: "now()"
    t.string   "contribuicao_publica", limit: 1, default: "N"
  end

  create_table "ci_sessions", id: false, force: true do |t|
    t.string  "session_id",    limit: 40, default: "0", null: false
    t.string  "ip_address",    limit: 16, default: "0"
    t.string  "user_agent",    limit: 50,               null: false
    t.integer "last_activity",            default: 0,   null: false
    t.text    "user_data"
  end

  create_table "cidades", force: true do |t|
    t.integer  "unidade_federativa_id"
    t.string   "nome"
    t.datetime "dt_cadastro",                      default: "now()", null: false
    t.string   "geo_latitude",          limit: 30
    t.string   "geo_longitude",         limit: 30
  end

  create_table "climas", force: true do |t|
    t.string   "descricao"
    t.datetime "dt_cadastro", default: "now()"
  end

  create_table "climas_paraformalidade", force: true do |t|
    t.integer  "clima_id"
    t.integer  "paraformalidade_id"
    t.datetime "dt_cadastro",        default: "now()"
  end

  create_table "colaboradores_paraformalidades", force: true do |t|
    t.integer  "pessoa_id"
    t.integer  "paraformalidade_id"
    t.datetime "dt_cadastro",        default: "now()"
  end

  create_table "condicionantes_ambientais", force: true do |t|
    t.string   "descricao"
    t.datetime "dt_cadastro", default: "now()"
  end

  create_table "condicionantes_ambientais_paraformalidade", force: true do |t|
    t.integer  "condicionante_ambiental_id"
    t.integer  "paraformalidade_id"
    t.datetime "dt_cadastro",                default: "now()"
  end

  create_table "condicoes_ambientais", force: true do |t|
    t.string   "descricao"
    t.datetime "dt_cadastro", default: "now()"
  end

  create_table "corpo_numeros", force: true do |t|
    t.string   "descricao"
    t.datetime "dt_cadastro", default: "now()"
  end

  create_table "corpo_posicoes", force: true do |t|
    t.string   "descricao"
    t.datetime "dt_cadastro", default: "now()"
  end

  create_table "correcao_paraformalidades", force: true do |t|
    t.integer  "paraformalidade_id"
    t.string   "pessoa_nome"
    t.string   "pessoa_email"
    t.string   "geo_latitude",       limit: 30
    t.string   "geo_longitude",      limit: 30
    t.string   "descricao"
    t.integer  "upload_id"
    t.cidr     "remote_addr"
    t.string   "antiga_latitude",    limit: 30
    t.string   "antiga_longitude",   limit: 30
    t.integer  "antiga_upload_id"
    t.string   "antiga_descricao"
    t.integer  "revisor_id"
    t.datetime "dt_cadastro",                   default: "now()"
  end

  create_table "denuncias", force: true do |t|
    t.string   "pessoa_nome"
    t.string   "pessoa_email"
    t.text     "denuncia"
    t.string   "link",         limit: 300
    t.cidr     "remote_addr"
    t.integer  "revisor_id"
    t.datetime "dt_cadastro",              default: "now()"
  end

  create_table "empresas", force: true do |t|
    t.string "nome"
    t.string "cnpj",        limit: 15
    t.date   "dt_cadastro"
  end

  create_table "empresas_perfis", id: false, force: true do |t|
    t.integer "empresa_id"
    t.integer "perfil_id"
  end

  create_table "enderecos", force: true do |t|
    t.integer  "pessoa_id"
    t.integer  "endereco_tipo_id"
    t.integer  "cidade_id"
    t.string   "cep",              limit: 20
    t.string   "rua"
    t.string   "numero",           limit: 10
    t.string   "bairro"
    t.string   "complemento"
    t.datetime "dt_cadastro",                 default: "now()", null: false
  end

  create_table "enderecos_tipos", force: true do |t|
    t.string   "descricao"
    t.string   "flg_tipo",    limit: 1
    t.datetime "dt_cadastro",           default: "now()", null: false
  end

  create_table "equipamento_instalacoes", force: true do |t|
    t.string   "descricao"
    t.datetime "dt_cadastro", default: "now()"
  end

  create_table "equipamento_instalacoes_paraformalidade", force: true do |t|
    t.integer  "equipamento_instalacao_id"
    t.integer  "paraformalidade_id"
    t.datetime "dt_cadastro",               default: "now()"
  end

  create_table "equipamento_mobilidades", force: true do |t|
    t.string   "descricao"
    t.datetime "dt_cadastro", default: "now()"
  end

  create_table "equipamento_portes", force: true do |t|
    t.string   "descricao"
    t.datetime "dt_cadastro", default: "now()"
  end

  create_table "equipe_grupos_atividade", force: true do |t|
    t.integer  "pessoa_id"
    t.integer  "grupo_atividade_id"
    t.integer  "participacao_equipe_id"
    t.datetime "dt_cadastro",            default: "now()"
  end

  create_table "equipe_registros_atividades", force: true do |t|
    t.integer  "pessoa_id"
    t.string   "entrada_saida", limit: 1
    t.datetime "data_hora",               default: "now()"
    t.text     "atividade"
    t.cidr     "remote_addr"
    t.cidr     "x_forwoard"
    t.datetime "dt_cadastro",             default: "now()"
  end

  create_table "espaco_localizacoes", force: true do |t|
    t.string   "descricao"
    t.datetime "dt_cadastro", default: "now()"
  end

  create_table "estados_civis", force: true do |t|
    t.string "descricao"
  end

  create_table "grupos_acessos", force: true do |t|
    t.string   "nome"
    t.datetime "dt_cadastro", default: "now()", null: false
  end

  create_table "grupos_acessos_empresas", force: true do |t|
    t.integer "grupo_acesso_id"
    t.integer "empresa_id"
  end

  create_table "grupos_acessos_perfis", force: true do |t|
    t.integer "grupo_acesso_id"
    t.integer "empresa_id"
    t.integer "perfil_id"
  end

  create_table "grupos_acessos_programas", force: true do |t|
    t.integer  "grupo_acesso_id"
    t.integer  "empresa_id"
    t.integer  "perfil_id"
    t.integer  "programa_id"
    t.datetime "dt_cadastro",     default: "now()", null: false
  end

  create_table "grupos_acessos_programas_permissoes", force: true do |t|
    t.integer  "grupo_acesso_id"
    t.integer  "sys_metodo_id"
    t.datetime "dt_cadastro",     default: "now()", null: false
  end

  create_table "grupos_atividades", force: true do |t|
    t.integer  "cidade_id"
    t.string   "geocode_origem_latitude",   limit: 30
    t.string   "geocode_origem_longitude",  limit: 30
    t.string   "geocode_destino_latitude",  limit: 30
    t.string   "geocode_destino_longitude", limit: 30
    t.date     "dt_ocorrencia"
    t.datetime "dt_cadastro",                          default: "now()"
    t.text     "descricao"
    t.string   "contribuicao_publica",      limit: 1,  default: "N"
  end

  create_table "log_fields", force: true do |t|
    t.integer "log_table_id"
    t.string  "field_name"
    t.text    "old_value"
    t.text    "new_value"
  end

  create_table "log_fields_structures", force: true do |t|
    t.integer "log_table_structure_id"
    t.string  "field_name"
  end

  create_table "log_tables", force: true do |t|
    t.string   "table_name"
    t.integer  "table_id"
    t.string   "flg_action",  limit: 10
    t.datetime "dt_register",            default: "now()", null: false
  end

  create_table "log_tables_structures", force: true do |t|
    t.string "table_name"
  end

  create_table "paraformalidades", force: true do |t|
    t.integer  "cena_id"
    t.integer  "upload_id"
    t.string   "descricao"
    t.string   "geo_latitude",              limit: 30
    t.string   "geo_longitude",             limit: 30
    t.string   "link"
    t.integer  "turno_ocorrencia_id"
    t.integer  "atividade_registrada_id"
    t.integer  "quantidade_registrada_id"
    t.integer  "espaco_localizacao_id"
    t.integer  "corpo_numero_id"
    t.integer  "corpo_posicao_id"
    t.integer  "equipamento_porte_id"
    t.integer  "equipamento_mobilidade_id"
    t.date     "dt_ocorrencia"
    t.string   "estaativa",                 limit: 1,  default: "S"
    t.datetime "dt_cadastro",                          default: "now()"
    t.string   "contribuicao_publica",      limit: 1,  default: "N"
  end

  create_table "paraformalidades", force: true do |t|
    t.integer  "cena_id"
    t.integer  "upload_id"
    t.string   "descricao"
    t.string   "geo_latitude",              limit: 30
    t.string   "geo_longitude",             limit: 30
    t.string   "link"
    t.integer  "turno_ocorrencia_id"
    t.integer  "atividade_registrada_id"
    t.integer  "quantidade_registrada_id"
    t.integer  "espaco_localizacao_id"
    t.integer  "corpo_numero_id"
    t.integer  "corpo_posicao_id"
    t.integer  "equipamento_porte_id"
    t.integer  "equipamento_mobilidade_id"
    t.date     "dt_ocorrencia"
    t.string   "estaativa",                 limit: 1,  default: "S"
    t.datetime "dt_cadastro",                          default: "now()"
    t.string   "contribuicao_publica",      limit: 1,  default: "N"
  end

  create_table "parametros", force: true do |t|
    t.string "nome"
    t.string "descricao"
    t.string "valor"
    t.date   "dt_cadastro"
  end

  create_table "participacoes_equipe", force: true do |t|
    t.string   "descricao"
    t.datetime "dt_cadastro", default: "now()"
  end

  create_table "perfis", force: true do |t|
    t.string "nome_perfil",                         null: false
    t.string "flg_ativo",   limit: 1, default: "S"
    t.date   "dt_cadastro"
  end

  create_table "perfis_programas", force: true do |t|
    t.integer "perfil_id"
    t.integer "programa_id"
    t.integer "programa_pai"
    t.integer "ordem"
    t.string  "flg_ativo",    limit: 1
  end

  create_table "pessoa_procedencias", force: true do |t|
    t.string   "descricao"
    t.datetime "dt_cadastro", default: "now()"
  end

  create_table "pessoas", force: true do |t|
    t.string   "nome",                                                                null: false
    t.string   "cpf",                                    limit: 15
    t.string   "rg",                                     limit: 15
    t.integer  "estado_civil_id"
    t.string   "sexo",                                   limit: 1
    t.date     "dt_nascimento"
    t.string   "nome_pai"
    t.string   "nome_mae"
    t.string   "telefone",                               limit: 25
    t.string   "celular",                                limit: 25
    t.string   "email"
    t.text     "observacao"
    t.datetime "dt_cadastro",                                       default: "now()", null: false
    t.string   "orgao_emissor_rg",                       limit: 10
    t.integer  "orgao_emissor_rg_unidade_federativa_id"
    t.string   "flg_mao_escrita",                        limit: 1,  default: "D"
    t.string   "nacionalidade"
    t.date     "dt_atualizacao_gol"
    t.string   "nr_titulo_eleitor",                      limit: 15
    t.string   "hash_ativacao"
    t.string   "email_ativacao"
    t.text     "senha_ativacao"
    t.integer  "foto_carteira_id"
    t.integer  "cod_carteira"
    t.integer  "pessoa_tipo_id"
    t.string   "nome_consulta"
    t.integer  "cidade_id"
    t.string   "profissao",                              limit: 50
  end

  create_table "pessoas_tipos", force: true do |t|
    t.string   "tipo",        limit: 50
    t.datetime "dt_cadastro",            default: "now()", null: false
  end

  create_table "programas", force: true do |t|
    t.string "nome_programa"
    t.string "descricao"
    t.string "link"
    t.string "onclick"
    t.date   "dt_cadastro"
  end

  create_table "programas_parametros", force: true do |t|
    t.integer  "programa_id"
    t.string   "nome"
    t.datetime "dt_cadastro", default: "now()", null: false
  end

  create_table "quantidades_registrada", force: true do |t|
    t.string   "descricao"
    t.datetime "dt_cadastro", default: "now()"
  end

  create_table "sentidos", force: true do |t|
    t.string   "descricao"
    t.datetime "dt_cadastro"
  end

  create_table "sentidos_paraformalidade", force: true do |t|
    t.integer  "sentido_id"
    t.integer  "paraformalidade_id"
    t.datetime "dt_cadastro",        default: "now()"
  end

  create_table "sys_metodos", force: true do |t|
    t.string   "classe"
    t.string   "metodo"
    t.string   "apelido"
    t.integer  "privado"
    t.datetime "dt_cadastro", default: "now()", null: false
  end

  create_table "sys_permissoes", force: true do |t|
    t.integer  "sys_metodo_id"
    t.integer  "usuario_id"
    t.datetime "dt_cadastro",   default: "now()", null: false
  end

  create_table "telefones", force: true do |t|
    t.integer  "pessoa_id",                                     null: false
    t.integer  "telefone_tipo_id",                              null: false
    t.string   "numero",           limit: 14
    t.datetime "dt_cadastro",                 default: "now()", null: false
  end

  create_table "telefones_tipos", force: true do |t|
    t.string   "descricao"
    t.string   "flg_tipo",    limit: 1
    t.datetime "dt_cadastro",           default: "now()", null: false
  end

  create_table "tipo_enderecos", force: true do |t|
    t.string "nome"
  end

  create_table "turnos_ocorrencia", force: true do |t|
    t.string   "descricao"
    t.datetime "dt_cadastro", default: "now()"
  end

  create_table "unidades_federativas", force: true do |t|
    t.string   "sigla",       limit: 2
    t.string   "nome"
    t.datetime "dt_cadastro",           default: "now()", null: false
  end

  create_table "uploads", force: true do |t|
    t.string   "nome_gerado"
    t.string   "nome_original"
    t.string   "tamanho",       limit: 10
    t.string   "tipo"
    t.datetime "dt_cadastro",              default: "now()", null: false
  end

  create_table "usuarios", force: true do |t|
    t.integer  "pessoa_id",                                  null: false
    t.string   "login",                                      null: false
    t.text     "senha"
    t.datetime "dt_cadastro",            default: "now()",   null: false
    t.string   "hash_id"
    t.integer  "avatar_id"
    t.string   "tema",        limit: 45, default: "redmond"
  end

  create_table "usuarios_empresas", id: false, force: true do |t|
    t.integer "usuario_id",             null: false
    t.integer "empresa_id",             null: false
    t.string  "empresa_boot", limit: 1
  end

  create_table "usuarios_grupos_acessos", force: true do |t|
    t.integer  "usuario_id"
    t.integer  "grupo_acesso_id"
    t.datetime "dt_cadastro",     default: "now()", null: false
  end

  create_table "usuarios_perfis", id: false, force: true do |t|
    t.integer "empresa_id"
    t.integer "usuario_id"
    t.integer "perfil_id"
  end

  create_table "usuarios_programas_acessos", force: true do |t|
    t.integer  "usuario_id"
    t.integer  "empresa_id"
    t.integer  "perfil_id"
    t.integer  "programa_id"
    t.datetime "dt_cadastro", default: "now()", null: false
  end

end
