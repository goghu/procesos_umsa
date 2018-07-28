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

ActiveRecord::Schema.define(version: 20180625161732) do

  create_table "cargos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "nombre"
    t.string "tipo"
    t.datetime "borrado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carreras", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "facultade_id"
    t.string "nombre", limit: 50
    t.string "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "denuncia", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "tipo_pe_persona", limit: 20
    t.string "nombre", limit: 50
    t.integer "persona_id"
    t.string "ci", limit: 20
    t.string "ru_item", limit: 30
    t.date "fecha"
    t.integer "facultad_id"
    t.integer "carrera_id"
    t.string "tipo_resol", limit: 20
    t.string "codigo_caso", limit: 30
    t.string "direccion"
    t.string "telefono", limit: 30
    t.string "observaciones"
    t.string "fallo", limit: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "elegidos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "persona_id"
    t.integer "cargo_id"
    t.date "fecha"
    t.integer "lista_id"
    t.datetime "borrado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "excels", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "nombre"
    t.string "archivo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "facultades", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "nombre"
    t.string "observaciones"
    t.string "estado"
    t.datetime "borrado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "impresos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "persona_id"
    t.integer "denuncium_id"
    t.date "fecha_emi_certf"
    t.string "correlt_certf"
    t.string "year"
    t.string "no_reg"
    t.string "numero"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lista", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "nombre"
    t.string "descripcion"
    t.datetime "borrado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "personas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "item"
    t.string "ci"
    t.string "nombre"
    t.string "facultad"
    t.string "carrera"
    t.string "direccion"
    t.string "telefono"
    t.string "tipo"
    t.string "categoria"
    t.string "fallo"
    t.string "observacion"
    t.string "correlt_certf"
    t.string "no_reg"
    t.date "fecha_emi_certf"
    t.datetime "borrado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ap_paterno", limit: 20
    t.string "ap_materno", limit: 30
    t.string "observaciones"
    t.string "correo"
    t.date "fecha"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "username"
    t.string "nombre"
    t.string "ap_paterno"
    t.string "ap_materno"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
