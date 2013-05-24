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

ActiveRecord::Schema.define(version: 20130524183417) do

  create_table "campos", force: true do |t|
    t.integer  "entidade_id"
    t.string   "nome"
    t.string   "tipo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "campos", ["entidade_id"], name: "index_campos_on_entidade_id"

  create_table "entidades", force: true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relacionamentos", force: true do |t|
    t.integer  "desta_id"
    t.integer  "para_esta_id"
    t.string   "tipo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relacionamentos", ["desta_id"], name: "index_relacionamentos_on_desta_id"
  add_index "relacionamentos", ["para_esta_id"], name: "index_relacionamentos_on_para_esta_id"

end
