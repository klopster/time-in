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

ActiveRecord::Schema.define(version: 20170410164656) do

  create_table "active_admin_comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "namespace"
    t.text     "body",          limit: 65535
    t.string   "resource_id",                 null: false
    t.string   "resource_type",               null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "craftmanships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "craftmanships_projects", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "craftmanship_id", null: false
    t.integer "project_id",      null: false
    t.index ["craftmanship_id", "project_id"], name: "index_craftmanships_projects_on_craftmanship_id_and_project_id", using: :btree
    t.index ["project_id", "craftmanship_id"], name: "index_craftmanships_projects_on_project_id_and_craftmanship_id", using: :btree
  end

  create_table "employees", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "username",               default: "",    null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "employee_name",          default: "",    null: false
    t.boolean  "admin",                  default: false, null: false
    t.integer  "craftmanship_id"
    t.date     "since"
    t.date     "up_to"
    t.boolean  "is_activ",               default: false, null: false
    t.integer  "pay_per_hour"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["craftmanship_id"], name: "index_employees_on_craftmanship_id", using: :btree
    t.index ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true, using: :btree
    t.index ["username"], name: "index_employees_on_username", unique: true, using: :btree
  end

  create_table "employees_tasks", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "employee_id", null: false
    t.integer "task_id",     null: false
    t.index ["employee_id", "task_id"], name: "index_employees_tasks_on_employee_id_and_task_id", using: :btree
    t.index ["task_id", "employee_id"], name: "index_employees_tasks_on_task_id_and_employee_id", using: :btree
  end

  create_table "projects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "project_id"
    t.string   "title"
    t.boolean  "is_done",    default: false
    t.date     "due_date"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

end
