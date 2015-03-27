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

ActiveRecord::Schema.define(version: 20150327200118) do

  create_table "attacks", force: :cascade do |t|
    t.string   "name"
    t.integer  "bonus"
    t.string   "damage"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "character_id"
  end

  add_index "attacks", ["character_id"], name: "index_attacks_on_character_id"

  create_table "characters", force: :cascade do |t|
    t.integer  "strength"
    t.integer  "dexterity"
    t.integer  "constitution"
    t.integer  "intelligence"
    t.integer  "wisdom"
    t.integer  "charisma"
    t.integer  "hp"
    t.integer  "hpmax"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "inspiration"
    t.integer  "proficiencybonus"
    t.integer  "strengthsave"
    t.integer  "dexteritysave"
    t.integer  "constitutionsave"
    t.integer  "intelligencesave"
    t.integer  "wisdomsave"
    t.integer  "charismasave"
    t.integer  "acrobatics"
    t.integer  "animalhandling"
    t.integer  "arcana"
    t.integer  "athletics"
    t.integer  "deception"
    t.integer  "history"
    t.integer  "insight"
    t.integer  "intimidation"
    t.integer  "investigation"
    t.integer  "medicine"
    t.integer  "nature"
    t.integer  "perception"
    t.integer  "performance"
    t.integer  "persuasion"
    t.integer  "religion"
    t.integer  "slightofhand"
    t.integer  "stealth"
    t.integer  "survival"
    t.string   "name"
    t.string   "classlevel"
    t.string   "background"
    t.string   "race"
    t.string   "alignment"
    t.integer  "experiencepoints"
    t.integer  "passiveperception"
    t.integer  "hitdice"
    t.integer  "hitdicemax"
    t.float    "carryweight"
    t.text     "proficiencies"
    t.text     "equipment"
    t.text     "featurestraits"
    t.integer  "user_id"
  end

  add_index "characters", ["user_id"], name: "index_characters_on_user_id"

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "email"
    t.string   "name"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
