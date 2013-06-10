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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130527113410) do

  create_table "adminlogins", :force => true do |t|
    t.string   "loginid"
    t.string   "password"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "contactpeople_14", :id => false, :force => true do |t|
    t.string "name",    :limit => 100
    t.string "email"
    t.string "phone"
    t.string "message"
  end

  create_table "contactpeople_15", :id => false, :force => true do |t|
    t.string "name",    :limit => 100
    t.string "email"
    t.string "phone"
    t.string "message"
  end

  create_table "contactpeople_16", :id => false, :force => true do |t|
    t.string "name",    :limit => 100
    t.string "email"
    t.string "phone"
    t.string "message"
  end

  create_table "contactpeople_17", :id => false, :force => true do |t|
    t.string "name",    :limit => 100
    t.string "email"
    t.string "phone"
    t.string "message"
  end

  create_table "contactpeople_18", :id => false, :force => true do |t|
    t.string "name",    :limit => 100
    t.string "email"
    t.string "phone"
    t.string "message"
  end

  create_table "contactpeople_23", :id => false, :force => true do |t|
    t.string "name",    :limit => 100
    t.string "email"
    t.string "phone"
    t.string "message"
  end

  create_table "contactpeople_25", :id => false, :force => true do |t|
    t.string "name",    :limit => 100
    t.string "email"
    t.string "phone"
    t.string "message"
  end

  create_table "contactpersonsses", :force => true do |t|
    t.integer  "phone"
    t.string   "name"
    t.string   "email"
    t.string   "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "contacts", :force => true do |t|
    t.integer  "contact_id"
    t.string   "name"
    t.string   "email"
    t.string   "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "customers", :force => true do |t|
    t.integer  "customer_id"
    t.string   "primary"
    t.string   "key"
    t.string   "name"
    t.string   "password"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "mastercontacts", :primary_key => "user_id", :force => true do |t|
    t.string   "content"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "masterhomes", :primary_key => "user_id", :force => true do |t|
    t.string   "c_name"
    t.integer  "phone"
    t.string   "address"
    t.string   "logo"
    t.string   "slider_img_1"
    t.string   "slider_img_2"
    t.string   "slider_img_3"
    t.string   "c_img_1"
    t.string   "c_img_2"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "company_img"
    t.string   "company_detail"
  end

  create_table "masterstories", :primary_key => "user_id", :force => true do |t|
    t.string   "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "masterusers", :force => true do |t|
    t.integer  "master_user_id"
    t.string   "shop_name"
    t.string   "password"
    t.string   "master_email"
    t.boolean  "validate"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "musers", :primary_key => "master_user_id", :force => true do |t|
    t.string   "shop_name"
    t.string   "password"
    t.string   "master_email"
    t.boolean  "validate"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "musers", ["shop_name"], :name => "index_musers_on_shop_name", :unique => true

  create_table "properties", :primary_key => "property_id", :force => true do |t|
    t.string   "property_name"
    t.integer  "price"
    t.string   "state"
    t.string   "property_type"
    t.string   "purpose"
    t.integer  "bedroom"
    t.string   "image"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "sub_property_type"
    t.string   "contant"
  end

  create_table "properties_14", :primary_key => "property_id", :force => true do |t|
    t.string  "property_name"
    t.string  "price"
    t.string  "state"
    t.string  "property_type"
    t.string  "purpose"
    t.integer "bedroom"
    t.string  "image"
    t.string  "sub_property_type"
    t.string  "contant"
    t.date    "created_at"
    t.date    "updated_at"
  end

  create_table "properties_15", :primary_key => "property_id", :force => true do |t|
    t.string  "property_name"
    t.string  "price"
    t.string  "state"
    t.string  "property_type"
    t.string  "purpose"
    t.integer "bedroom"
    t.string  "image"
    t.string  "sub_property_type"
    t.string  "contant"
    t.date    "created_at"
    t.date    "updated_at"
  end

  create_table "properties_16", :primary_key => "property_id", :force => true do |t|
    t.string  "property_name"
    t.string  "price"
    t.string  "state"
    t.string  "property_type"
    t.string  "purpose"
    t.integer "bedroom"
    t.string  "image"
    t.string  "sub_property_type"
    t.string  "contant"
    t.date    "created_at"
    t.date    "updated_at"
  end

  create_table "properties_17", :primary_key => "property_id", :force => true do |t|
    t.string  "property_name"
    t.string  "price"
    t.string  "state"
    t.string  "property_type"
    t.string  "purpose"
    t.integer "bedroom"
    t.string  "image"
    t.string  "sub_property_type"
    t.string  "contant"
    t.date    "created_at"
    t.date    "updated_at"
  end

  create_table "properties_18", :primary_key => "property_id", :force => true do |t|
    t.string  "property_name"
    t.string  "price"
    t.string  "state"
    t.string  "property_type"
    t.string  "purpose"
    t.integer "bedroom"
    t.string  "image"
    t.string  "sub_property_type"
    t.string  "contant"
    t.date    "created_at"
    t.date    "updated_at"
  end

  create_table "properties_23", :primary_key => "property_id", :force => true do |t|
    t.string  "property_name"
    t.string  "price"
    t.string  "state"
    t.string  "property_type"
    t.string  "purpose"
    t.integer "bedroom"
    t.string  "image"
    t.string  "sub_property_type"
    t.string  "contant"
    t.date    "created_at"
    t.date    "updated_at"
  end

  create_table "properties_25", :primary_key => "property_id", :force => true do |t|
    t.string  "property_name"
    t.string  "price"
    t.string  "state"
    t.string  "property_type"
    t.string  "purpose"
    t.integer "bedroom"
    t.string  "image"
    t.string  "sub_property_type"
    t.string  "contant"
    t.date    "created_at"
    t.date    "updated_at"
  end

  create_table "propertylists", :force => true do |t|
    t.integer  "user_id"
    t.integer  "property_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "stories", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "phone"
    t.string   "story"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "storiesses", :force => true do |t|
    t.integer  "storyid"
    t.string   "name"
    t.string   "email"
    t.integer  "phone"
    t.string   "story"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "storiesses_14", :primary_key => "story_id", :force => true do |t|
    t.integer "sub_user_id"
    t.string  "name",        :limit => 100
    t.string  "email"
    t.string  "phone"
    t.string  "story"
    t.string  "image",       :limit => 2
  end

  create_table "storiesses_15", :primary_key => "story_id", :force => true do |t|
    t.integer "sub_user_id"
    t.string  "name",        :limit => 100
    t.string  "email"
    t.string  "phone"
    t.string  "story"
    t.string  "image",       :limit => 2
  end

  create_table "storiesses_16", :primary_key => "story_id", :force => true do |t|
    t.integer "sub_user_id"
    t.string  "name",        :limit => 100
    t.string  "email"
    t.string  "phone"
    t.string  "story"
    t.string  "image",       :limit => 2
  end

  create_table "storiesses_17", :primary_key => "story_id", :force => true do |t|
    t.integer "sub_user_id"
    t.string  "name",        :limit => 100
    t.string  "email"
    t.string  "phone"
    t.string  "story"
    t.string  "image",       :limit => 2
  end

  create_table "storiesses_18", :primary_key => "story_id", :force => true do |t|
    t.integer "sub_user_id"
    t.string  "name",        :limit => 100
    t.string  "email"
    t.string  "phone"
    t.string  "story"
    t.string  "image",       :limit => 2
  end

  create_table "storiesses_23", :primary_key => "story_id", :force => true do |t|
    t.integer "sub_user_id"
    t.string  "name",        :limit => 100
    t.string  "email"
    t.string  "phone"
    t.string  "story"
    t.string  "image",       :limit => 2
  end

  create_table "storiesses_25", :primary_key => "story_id", :force => true do |t|
    t.integer "sub_user_id"
    t.string  "name",        :limit => 100
    t.string  "email"
    t.string  "phone"
    t.string  "story"
    t.string  "image",       :limit => 2
  end

  create_table "storis", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "phone"
    t.string   "story"
    t.string   "image"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  create_table "users", :primary_key => "user_id", :force => true do |t|
    t.string   "name"
    t.string   "password"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "my_properties"
    t.string   "email"
    t.boolean  "validate"
  end

  create_table "users_14", :primary_key => "sub_user_id", :force => true do |t|
    t.string  "name",          :limit => 100
    t.string  "password"
    t.string  "my_properties"
    t.string  "email"
    t.boolean "validates"
  end

  create_table "users_15", :primary_key => "sub_user_id", :force => true do |t|
    t.string  "name",          :limit => 100
    t.string  "password"
    t.string  "my_properties"
    t.string  "email"
    t.boolean "validates"
  end

  create_table "users_16", :primary_key => "sub_user_id", :force => true do |t|
    t.string  "name",          :limit => 100
    t.string  "password"
    t.string  "my_properties"
    t.string  "email"
    t.boolean "validates"
  end

  create_table "users_17", :primary_key => "sub_user_id", :force => true do |t|
    t.string  "name",          :limit => 100
    t.string  "password"
    t.string  "my_properties"
    t.string  "email"
    t.boolean "validates"
  end

  create_table "users_18", :primary_key => "sub_user_id", :force => true do |t|
    t.string  "name",          :limit => 100
    t.string  "password"
    t.string  "my_properties"
    t.string  "email"
    t.boolean "validates"
  end

  create_table "users_23", :primary_key => "sub_user_id", :force => true do |t|
    t.string  "name",          :limit => 100
    t.string  "password"
    t.string  "my_properties"
    t.string  "email"
    t.boolean "validates"
  end

  create_table "users_25", :primary_key => "sub_user_id", :force => true do |t|
    t.string  "name",          :limit => 100
    t.string  "password"
    t.string  "my_properties"
    t.string  "email"
    t.boolean "validates"
  end

end
