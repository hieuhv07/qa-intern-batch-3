ActiveRecord::Schema.define(version: 2019_07_30_063716) do

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "username"
    t.string "fullname"
    t.string "email"
    t.string "password_digest"
    t.string "activation_digest"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.string "remember_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email"
  end

end
