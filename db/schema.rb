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

ActiveRecord::Schema.define(version: 20140807174156) do

  create_table "collections", force: true do |t|
    t.string "name"
  end

  create_table "entities", force: true do |t|
    t.integer "entity_type_id"
    t.integer "entity_sub_type_id"
    t.integer "collection_id"
    t.string  "title"
    t.text    "synopsis"
    t.integer "seasons"
    t.integer "episodes"
    t.integer "year"
    t.integer "score"
  end

  create_table "entities_relations", id: false, force: true do |t|
    t.integer "entity_id"
    t.integer "relation_id"
    t.integer "related_entity_id"
  end

  create_table "entities_tags", id: false, force: true do |t|
    t.integer "entity_id"
    t.integer "tag_id"
  end

  create_table "entity_sub_types", force: true do |t|
    t.string  "name"
    t.integer "entitytype_id"
  end

  create_table "entity_types", force: true do |t|
    t.string "name"
    t.string "pagination_path"
    t.string "view_path"
  end

  create_table "relations", force: true do |t|
    t.string  "name"
    t.integer "opposite_id"
  end

  create_table "tags", force: true do |t|
    t.string "name"
    t.text   "description"
  end

end
