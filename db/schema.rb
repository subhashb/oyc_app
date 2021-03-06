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

ActiveRecord::Schema.define(:version => 20110525064617) do

  create_table "billitems", :force => true do |t|
    t.string   "isbn"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bill_id",    :precision => 38, :scale => 0
    t.decimal  "conv_rate"
    t.decimal  "discount"
    t.decimal  "netamt"
    t.integer  "title_id",   :precision => 38, :scale => 0
    t.decimal  "grossamt"
  end

  create_table "bills", :force => true do |t|
    t.datetime "date_of_billing"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by",      :precision => 38, :scale => 0
    t.integer  "updated_by",      :precision => 38, :scale => 0
    t.integer  "bookfair_id",     :precision => 38, :scale => 0, :null => false
    t.decimal  "grossamt"
    t.integer  "quantity",        :precision => 38, :scale => 0
    t.decimal  "netamt"
  end

  create_table "bookfairs", :force => true do |t|
    t.string   "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "created_by", :precision => 38, :scale => 0
    t.integer  "updated_by", :precision => 38, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "active"
  end

  create_table "invoices", :force => true do |t|
    t.string   "invoice_no",                                                    :null => false
    t.datetime "date_of_invoice"
    t.string   "isbn",                                                          :null => false
    t.string   "title",                                                         :null => false
    t.string   "publisher",                                                     :null => false
    t.string   "author"
    t.integer  "quantity",        :precision => 38, :scale => 0,                :null => false
    t.decimal  "grossamt",                                                      :null => false
    t.string   "currency"
    t.decimal  "conv_rate"
    t.decimal  "discount"
    t.decimal  "netamt"
    t.integer  "received_cnt",    :precision => 38, :scale => 0, :default => 0
    t.integer  "created_by",      :precision => 38, :scale => 0
    t.integer  "updated_by",      :precision => 38, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "supplier_id",     :precision => 38, :scale => 0
  end

  create_table "isbns", :force => true do |t|
    t.string   "isbn"
    t.string   "title"
    t.string   "author"
    t.string   "publisher"
    t.decimal  "grossamt"
    t.string   "currency"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stockaudititems", :force => true do |t|
    t.integer  "bookfair_id", :precision => 38, :scale => 0
    t.string   "isbn"
    t.integer  "created_by",  :precision => 38, :scale => 0
    t.integer  "modified_by", :precision => 38, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "titlereceipts", :force => true do |t|
    t.string   "po_no"
    t.string   "invoice_no"
    t.string   "isbn"
    t.integer  "created_by",  :precision => 38, :scale => 0
    t.integer  "modified_by", :precision => 38, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "invoice_id",  :precision => 38, :scale => 0
    t.integer  "box_no",      :precision => 38, :scale => 0
    t.integer  "supplier_id", :precision => 38, :scale => 0
  end

  create_table "titles", :force => true do |t|
    t.string   "isbn"
    t.integer  "bookfair_id", :precision => 38, :scale => 0
    t.integer  "copies_cnt",  :precision => 38, :scale => 0
    t.integer  "sold_cnt",    :precision => 38, :scale => 0
    t.integer  "created_by",  :precision => 38, :scale => 0
    t.integer  "modified_by", :precision => 38, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "invoice_id",  :precision => 38, :scale => 0
  end

  add_index "titles", ["bookfair_id", "isbn", "invoice_id"], :name => "titles_fairitem_unq", :unique => true

  add_synonym "authentications", "authentications@link_opac", :force => true
  add_synonym "users", "users@link_opac", :force => true
  add_synonym "users_seq", "users_seq@link_opac", :force => true
  add_synonym "suppliers", "suppliers@link_ams", :force => true

end
