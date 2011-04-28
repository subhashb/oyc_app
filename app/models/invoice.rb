# == Schema Information
# Schema version: 20110427172104
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
#  received_cnt    :integer(38)     default(0)
#  created_by      :integer(38)
#  updated_by      :integer(38)
#  created_at      :datetime
#  updated_at      :datetime
#  supplier_id     :integer(38)
#

class Invoice < ActiveRecord::Base
  belongs_to  :supplier
  has_many    :billitems
  has_many    :titlereceipts
  
  scope :next_to_sell, lambda { |isbn|
      where("isbn = :isbn AND sold_cnt<received_cnt", {:isbn => isbn}).
      order(:id).
      limit(1)
    }  
  scope :distinct_suppliers, :select => "DISTINCT supplier_id"
  scope :of_supplier, lambda { |supplier_id|
      where(:supplier_id => supplier_id)
    }
end
