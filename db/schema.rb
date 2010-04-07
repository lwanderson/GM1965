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

ActiveRecord::Schema.define(:version => 20100403004854) do

  create_table "class_members", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "suffix"
    t.string   "class_name"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "postal_code"
    t.string   "country"
    t.boolean  "verified"
    t.string   "email_address"
    t.string   "spouse"
    t.string   "mailing"
    t.string   "last_contact"
    t.string   "last_attended"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.text     "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "registrations", :force => true do |t|
    t.string   "first_name"
    t.string   "mi"
    t.string   "last_name"
    t.string   "suffix"
    t.string   "class_name"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "province"
    t.string   "country"
    t.string   "email"
    t.string   "gm_street"
    t.string   "gm_colors"
    t.string   "gm_PIAA"
    t.string   "class_colors"
    t.string   "class_motto"
    t.string   "class_flower"
    t.string   "class_size"
    t.boolean  "processed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "registrations", ["email"], :name => "registrations_email_idx"

  create_table "users", :force => true do |t|
    t.string   "username",              :null => false
    t.string   "password",              :null => false
    t.datetime "expires"
    t.datetime "last_password_change"
    t.boolean  "force_password_change"
    t.boolean  "enabled"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["username"], :name => "users_username_idx"

end
