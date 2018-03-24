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

ActiveRecord::Schema.define(version: 20160419185211) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attached_files", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "storage_id"
    t.string   "storage_type"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size",    default: 0
    t.datetime "attachment_updated_at"
    t.string   "processing",              default: "none"
    t.boolean  "watermark",               default: false
    t.string   "watermark_text",          default: ""
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth",                   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attached_images", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "holder_id"
    t.string   "holder_type"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size",    default: 0
    t.datetime "file_updated_at"
    t.text     "raw_description"
    t.text     "description"
    t.string   "processing",        default: "none"
    t.boolean  "watermark",         default: false
    t.string   "watermark_text",    default: ""
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth",             default: 0
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer  "cart_id"
    t.integer  "item_id"
    t.string   "item_type"
    t.integer  "amount"
    t.decimal  "price",      precision: 8, scale: 2
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "carts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "uid",                default: ""
    t.integer  "cart_items_counter"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "comment_subscriptions", force: :cascade do |t|
    t.integer "user_id"
    t.integer "comment_id"
    t.string  "email",      default: ""
    t.string  "state",      default: "active"
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "holder_id"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.string   "commentable_url"
    t.string   "commentable_title"
    t.string   "commentable_state"
    t.string   "anchor"
    t.string   "title"
    t.string   "contacts"
    t.text     "raw_content"
    t.text     "content"
    t.string   "view_token"
    t.string   "state",                 default: ""
    t.string   "ip",                    default: "undefined"
    t.string   "referer",               default: "undefined"
    t.string   "user_agent",            default: "undefined"
    t.integer  "tolerance_time"
    t.boolean  "spam",                  default: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth",                 default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "akismet_state",         default: "default"
    t.string   "yandex_cleanweb_state", default: "default"
    t.string   "yandex_cleanweb_id",    default: ""
  end

  create_table "credentials", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "expires_at"
    t.text     "access_token"
    t.text     "access_token_secret"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "currency_rates", force: :cascade do |t|
    t.decimal  "rur_usd",    precision: 8, scale: 4
    t.decimal  "rur_eur",    precision: 8, scale: 4
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "delivery_addresses", force: :cascade do |t|
    t.string   "title",            limit: 255, default: ""
    t.string   "email",            limit: 255, default: ""
    t.string   "phone",            limit: 255, default: ""
    t.string   "full_name",        limit: 255, default: ""
    t.string   "country",          limit: 255, default: ""
    t.string   "region",           limit: 255, default: ""
    t.string   "city",             limit: 255, default: ""
    t.string   "postcode",         limit: 255, default: ""
    t.string   "street",           limit: 255, default: ""
    t.string   "house_number",     limit: 255, default: ""
    t.text     "delivery_comment"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "delivery_types", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title",                     limit: 255,                         default: ""
    t.string   "delivery_kind",             limit: 255,                         default: "special"
    t.decimal  "price",                                 precision: 8, scale: 2
    t.text     "raw_intro"
    t.text     "intro"
    t.text     "raw_content"
    t.text     "content"
    t.string   "editor_type",                                                   default: "ckeditor"
    t.string   "state",                     limit: 255,                         default: "draft"
    t.boolean  "default_option",                                                default: false
    t.boolean  "order_moderation_required",                                     default: false
    t.datetime "created_at",                                                                         null: false
    t.datetime "updated_at",                                                                         null: false
  end

  create_table "email_registration_requests", force: :cascade do |t|
    t.string   "uid",        default: ""
    t.string   "email",      default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "hubs", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "slug",                    default: ""
    t.string   "short_id",                default: ""
    t.string   "friendly_id",             default: ""
    t.string   "main_image_file_name"
    t.string   "main_image_content_type"
    t.integer  "main_image_file_size",    default: 0
    t.datetime "main_image_updated_at"
    t.string   "title",                   default: ""
    t.text     "raw_intro"
    t.text     "intro"
    t.text     "raw_content"
    t.text     "content"
    t.string   "view_layout",             default: ""
    t.string   "view_template",           default: ""
    t.boolean  "optgroup",                default: false
    t.integer  "view_counter",            default: 0
    t.string   "state",                   default: "draft"
    t.string   "legacy_url"
    t.string   "inline_tags",             default: ""
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth",                   default: 0
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meta_data", force: :cascade do |t|
    t.integer  "holder_id"
    t.string   "holder_type"
    t.text     "title"
    t.text     "keywords"
    t.text     "description"
    t.text     "author"
    t.text     "og_url"
    t.string   "og_type"
    t.text     "og_image"
    t.text     "og_site_name"
    t.text     "og_title"
    t.text     "og_description"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "onetime_login_links", force: :cascade do |t|
    t.string   "uid",        default: ""
    t.string   "email",      default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "item_id"
    t.string   "item_type"
    t.integer  "amount"
    t.decimal  "price",      precision: 10, scale: 2
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "uid",                 limit: 255,                          default: ""
    t.string   "state",               limit: 255,                          default: "draft"
    t.string   "email",               limit: 255,                          default: ""
    t.string   "phone",               limit: 255,                          default: ""
    t.string   "full_name",           limit: 255,                          default: ""
    t.string   "country",             limit: 255,                          default: ""
    t.string   "region",              limit: 255,                          default: ""
    t.string   "city",                limit: 255,                          default: ""
    t.string   "postcode",            limit: 255,                          default: ""
    t.string   "street",              limit: 255,                          default: ""
    t.string   "house_number",        limit: 255,                          default: ""
    t.text     "delivery_comment"
    t.string   "track_site",          limit: 255,                          default: ""
    t.string   "track_code",          limit: 255,                          default: ""
    t.decimal  "products_price",                  precision: 10, scale: 2
    t.decimal  "delivery_price",                  precision: 10, scale: 2
    t.decimal  "discount",                        precision: 10, scale: 2
    t.decimal  "price_correction",                precision: 10, scale: 2
    t.decimal  "total_price",                     precision: 10, scale: 2
    t.integer  "order_items_counter",                                      default: 0
    t.datetime "created_at",                                                                 null: false
    t.datetime "updated_at",                                                                 null: false
  end

  create_table "pages", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "slug",                     default: ""
    t.string   "short_id",                 default: ""
    t.string   "friendly_id",              default: ""
    t.string   "main_image_file_name"
    t.string   "main_image_content_type"
    t.integer  "main_image_file_size",     default: 0
    t.datetime "main_image_updated_at"
    t.string   "title",                    default: ""
    t.text     "raw_intro"
    t.text     "intro"
    t.text     "raw_content"
    t.text     "content"
    t.string   "editor_type",              default: "ckeditor"
    t.string   "view_layout",              default: ""
    t.string   "view_template",            default: ""
    t.boolean  "optgroup",                 default: false
    t.integer  "view_counter",             default: 0
    t.string   "state",                    default: "draft"
    t.string   "legacy_url"
    t.string   "inline_tags",              default: ""
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "draft_comments_count",     default: 0
    t.integer  "published_comments_count", default: 0
    t.integer  "deleted_comments_count",   default: 0
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "slug",                     default: ""
    t.string   "short_id",                 default: ""
    t.string   "friendly_id",              default: ""
    t.string   "main_image_file_name"
    t.string   "main_image_content_type"
    t.integer  "main_image_file_size",     default: 0
    t.datetime "main_image_updated_at"
    t.string   "title",                    default: ""
    t.text     "raw_intro"
    t.text     "intro"
    t.text     "raw_content"
    t.text     "content"
    t.string   "editor_type",              default: "ckeditor"
    t.string   "view_layout",              default: ""
    t.string   "view_template",            default: ""
    t.boolean  "optgroup",                 default: false
    t.integer  "view_counter",             default: 0
    t.string   "state",                    default: "draft"
    t.string   "legacy_url"
    t.string   "inline_tags",              default: ""
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "draft_comments_count",     default: 0
    t.integer  "published_comments_count", default: 0
    t.integer  "deleted_comments_count",   default: 0
  end

  create_table "products", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "slug",                                                           default: ""
    t.string   "short_id",                                                       default: ""
    t.string   "friendly_id",                                                    default: ""
    t.string   "title",                                                          default: ""
    t.string   "sku",                                                            default: ""
    t.string   "vendor_sku",                                                     default: ""
    t.integer  "amount",                                                         default: 0
    t.decimal  "eur_price",                             precision: 10, scale: 2
    t.decimal  "usd_price",                             precision: 10, scale: 2
    t.decimal  "rur_price",                             precision: 10, scale: 2
    t.string   "active_currency",                                                default: "RUR"
    t.decimal  "active_price",                          precision: 10, scale: 2
    t.decimal  "min_active_price",                      precision: 10, scale: 2
    t.decimal  "max_active_price",                      precision: 10, scale: 2
    t.integer  "discount_percent",                                               default: 0
    t.string   "price_text",                limit: 255,                          default: ""
    t.text     "raw_intro"
    t.text     "intro"
    t.text     "raw_content"
    t.text     "content"
    t.string   "editor_type",                                                    default: "ckeditor"
    t.text     "equipment",                                                      default: ""
    t.boolean  "novelty",                                                        default: false
    t.integer  "popularity",                                                     default: 0
    t.string   "special_marker",                                                 default: ""
    t.decimal  "popularity_rate",                       precision: 8,  scale: 2
    t.text     "fts_auto_data"
    t.text     "fts_manual_data"
    t.decimal  "weight",                                precision: 8,  scale: 2
    t.decimal  "dimension_x",                           precision: 8,  scale: 2, default: 0.0
    t.decimal  "dimension_y",                           precision: 8,  scale: 2, default: 0.0
    t.decimal  "dimension_z",                           precision: 8,  scale: 2, default: 0.0
    t.string   "dimensions",                                                     default: ""
    t.boolean  "ym_available",                                                   default: false
    t.string   "ym_vendor",                                                      default: ""
    t.string   "ym_model",                                                       default: ""
    t.string   "ym_vendor_code",                                                 default: ""
    t.string   "ym_country_of_origin",                                           default: ""
    t.boolean  "ym_manufacturer_warranty",                                       default: false
    t.boolean  "ym_cpa",                                                         default: false
    t.boolean  "ym_receiving_delivery",                                          default: false
    t.boolean  "ym_receiving_pickup",                                            default: false
    t.boolean  "ym_receiving_store",                                             default: false
    t.string   "ym_type_prefix",                                                 default: ""
    t.string   "ym_market_category",                                             default: ""
    t.string   "ym_sales_notes",                                                 default: ""
    t.string   "ya_barcode",                                                     default: ""
    t.boolean  "ya_adult",                                                       default: false
    t.boolean  "ya_downloadable",                                                default: false
    t.string   "state",                                                          default: "draft"
    t.integer  "show_count",                                                     default: 0
    t.boolean  "order_moderation_required",                                      default: false
    t.datetime "published_at"
    t.datetime "created_at",                                                                          null: false
    t.datetime "updated_at",                                                                          null: false
    t.integer  "draft_comments_count",                                           default: 0
    t.integer  "published_comments_count",                                       default: 0
    t.integer  "deleted_comments_count",                                         default: 0
    t.decimal  "warranty_time_units",                   precision: 8,  scale: 2, default: 0.0
  end

  create_table "pub_category_rels", force: :cascade do |t|
    t.integer  "category_id"
    t.string   "category_type"
    t.integer  "item_id"
    t.string   "item_type"
    t.string   "item_title",        default: ""
    t.string   "item_state",        default: "draft"
    t.datetime "item_created_at"
    t.datetime "item_updated_at"
    t.datetime "item_published_at"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth",             default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pub_tags", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "slug",                    default: ""
    t.string   "short_id",                default: ""
    t.string   "friendly_id",             default: ""
    t.string   "main_image_file_name"
    t.string   "main_image_content_type"
    t.integer  "main_image_file_size",    default: 0
    t.datetime "main_image_updated_at"
    t.string   "title",                   default: ""
    t.text     "raw_intro"
    t.text     "intro"
    t.text     "raw_content"
    t.text     "content"
    t.string   "view_layout",             default: ""
    t.string   "view_template",           default: ""
    t.boolean  "optgroup",                default: false
    t.integer  "view_counter",            default: 0
    t.string   "state",                   default: "draft"
    t.string   "legacy_url"
    t.string   "inline_tags",             default: ""
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth",                   default: 0
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shop_brands", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "slug",         default: ""
    t.string   "short_id",     default: ""
    t.string   "friendly_id",  default: ""
    t.string   "title",        default: ""
    t.text     "raw_intro"
    t.text     "intro"
    t.text     "raw_content"
    t.text     "content"
    t.string   "editor_type",  default: "ckeditor"
    t.string   "url",          default: ""
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth",        default: 0
    t.string   "state",        default: "draft"
    t.boolean  "optgroup",     default: false
    t.integer  "show_count",   default: 0
    t.datetime "published_at"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "shop_categories", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "slug",                     default: ""
    t.string   "short_id",                 default: ""
    t.string   "friendly_id",              default: ""
    t.string   "title",                    default: ""
    t.text     "raw_intro"
    t.text     "intro"
    t.text     "raw_content"
    t.text     "content"
    t.string   "editor_type",              default: "ckeditor"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth",                    default: 0
    t.string   "state",                    default: "draft"
    t.boolean  "optgroup",                 default: false
    t.integer  "show_count",               default: 0
    t.integer  "products_draft_count",     default: 0
    t.integer  "products_published_count", default: 0
    t.integer  "products_deleted_count",   default: 0
    t.datetime "published_at"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  create_table "shop_category_rels", force: :cascade do |t|
    t.integer  "category_id"
    t.string   "category_type"
    t.integer  "item_id"
    t.string   "item_type"
    t.string   "item_title",                                               default: ""
    t.string   "item_state",                                               default: "draft"
    t.integer  "item_amount",                                              default: 0
    t.integer  "item_discount_percent",                                    default: 0
    t.boolean  "item_novelty",                                             default: false
    t.decimal  "item_popularity_rate",            precision: 8,  scale: 2
    t.decimal  "item_active_price",               precision: 10, scale: 2
    t.decimal  "item_active_price_with_discount", precision: 10, scale: 2
    t.integer  "item_shop_params_card_id"
    t.string   "item_shop_params_card_type"
    t.datetime "item_created_at"
    t.datetime "item_updated_at"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth",                                                    default: 0
    t.datetime "created_at",                                                                 null: false
    t.datetime "updated_at",                                                                 null: false
  end

  add_index "shop_category_rels", ["category_type", "category_id"], name: "index_shop_category_rels_on_category_type_and_category_id", using: :btree
  add_index "shop_category_rels", ["item_type", "item_id"], name: "index_shop_category_rels_on_item_type_and_item_id", using: :btree

  create_table "shop_colors", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "slug",         default: ""
    t.string   "short_id",     default: ""
    t.string   "friendly_id",  default: ""
    t.string   "title",        default: ""
    t.string   "hex_color",    default: "#000"
    t.text     "raw_intro"
    t.text     "intro"
    t.text     "raw_content"
    t.text     "content"
    t.string   "editor_type",  default: "ckeditor"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth",        default: 0
    t.string   "state",        default: "draft"
    t.boolean  "optgroup",     default: false
    t.integer  "show_count",   default: 0
    t.datetime "published_at"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "shop_unit_ports", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "slug",         default: ""
    t.string   "short_id",     default: ""
    t.string   "friendly_id",  default: ""
    t.string   "title",        default: ""
    t.text     "raw_intro"
    t.text     "intro"
    t.text     "raw_content"
    t.text     "content"
    t.string   "editor_type",  default: "ckeditor"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth",        default: 0
    t.string   "state",        default: "draft"
    t.boolean  "optgroup",     default: false
    t.integer  "show_count",   default: 0
    t.datetime "published_at"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                       default: "", null: false
    t.string   "encrypted_password",          default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",               default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "login",                       default: ""
    t.string   "username",                    default: ""
    t.text     "raw_about"
    t.text     "about"
    t.string   "vk_addr",                     default: ""
    t.string   "ok_addr",                     default: ""
    t.string   "tw_addr",                     default: ""
    t.string   "fb_addr",                     default: ""
    t.string   "gp_addr",                     default: ""
    t.string   "ig_addr",                     default: ""
    t.string   "pt_addr",                     default: ""
    t.string   "yt_addr",                     default: ""
    t.string   "vm_addr",                     default: ""
    t.string   "sh_addr",                     default: ""
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "my_draft_comments_count",     default: 0
    t.integer  "my_published_comments_count", default: 0
    t.integer  "my_comments_count",           default: 0
    t.integer  "draft_comcoms_count",         default: 0
    t.integer  "published_comcoms_count",     default: 0
    t.integer  "deleted_comcoms_count",       default: 0
    t.integer  "spam_comcoms_count",          default: 0
    t.integer  "draft_comments_count",        default: 0
    t.integer  "published_comments_count",    default: 0
    t.integer  "deleted_comments_count",      default: 0
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
