# == Schema Information
# Schema version: 20110420075940
#
# Table name: invoices
#
#  id              :integer(38)     not null, primary key
#  invoice_no      :string(255)     not null
#  date_of_invoice :datetime
#  isbn            :string(255)     not null
#  title           :string(255)     not null
#  publisher       :string(255)     not null
#  author          :string(255)
#  quantity        :integer(38)     not null
#  grossamt        :decimal(, )     not null
#  currency        :string(255)
#  conv_rate       :decimal(, )
#  discount        :decimal(, )
#  netamt          :decimal(, )
#  received_cnt    :string(255)     default("0")
#  sold_cnt        :string(255)     default("0")
#  created_by      :integer(38)
#  updated_by      :integer(38)
#  created_at      :datetime
#  updated_at      :datetime
#  supplier_id     :integer(38)
#

class Invoice < ActiveRecord::Base
  belongs_to supplier
end
