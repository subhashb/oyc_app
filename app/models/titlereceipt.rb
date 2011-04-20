# == Schema Information
# Schema version: 20110420043817
#
# Table name: titlereceipts
#
#  id          :integer(38)     not null, primary key
#  po_no       :string(255)
#  invoice_no  :string(255)
#  isbn        :string(255)
#  box_no      :integer(38)
#  created_by  :integer(38)
#  modified_by :integer(38)
#  created_at  :datetime
#  updated_at  :datetime
#

class Titlereceipt < ActiveRecord::Base
  
  #PO is not being generated right now
  #validates :po_no,             :presence => true
  
  validates :invoice_no,        :presence => true
  validates :isbn,              :presence => true
  validates :box_no,            :presence => true
end
