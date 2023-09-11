# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_09_11_130837) do

  create_table "alunos", force: :cascade do |t|
    t.string "nome"
    t.date "data_nascimento"
    t.integer "turma_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["turma_id"], name: "index_alunos_on_turma_id"
  end

  create_table "disciplinas", force: :cascade do |t|
    t.string "nome"
    t.text "descricao"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "equipe_escolars", force: :cascade do |t|
    t.string "nome"
    t.string "cargo"
    t.integer "turma_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["turma_id"], name: "index_equipe_escolars_on_turma_id"
  end

  create_table "professors", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "telefone"
    t.integer "turma_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["turma_id"], name: "index_professors_on_turma_id"
  end

  create_table "responsavels", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "telefone"
    t.integer "aluno_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["aluno_id"], name: "index_responsavels_on_aluno_id"
  end

  create_table "turmas", force: :cascade do |t|
    t.string "nome"
    t.text "descricao"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "unidades", force: :cascade do |t|
    t.string "nome"
    t.string "endereco"
    t.string "telefone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "alunos", "turmas"
  add_foreign_key "equipe_escolars", "turmas"
  add_foreign_key "professors", "turmas"
  add_foreign_key "responsavels", "alunos"
end
