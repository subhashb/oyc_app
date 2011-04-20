# == Schema Information
# Schema version: 20110420145554
#
# Table name: titlereceipts
#
#  id          :integer(38)     not null, primary key
#  po_no       :string(255)
#  invoice_no  :string(255)
#  isbn        :string(255)
#  created_by  :integer(38)
#  modified_by :integer(38)
#  created_at  :datetime
#  updated_at  :datetime
#  invoice_id  :integer(38)
#  box_no      :integer(38)
#

class Titlereceipt < ActiveRecord::Base
  #validates :po_no,             :presence => true          #PO is not being generated right now
  validates :invoice_no,        :presence => true
  validates :isbn,              :presence => true
  validates :box_no,            :presence => true
  
  validate :invoice_no_should_exist
  validate :isbn_should_be_part_of_invoice
  validate :excess_quantity
  
  after_create :mark_receipt_in_invoice
  
  scope :of_invoice, lambda { |invoice_no, isbn|
      where("invoice_no = :invoice_no AND isbn = :isbn", {:invoice_no => invoice_no, :isbn => isbn}).
      order("created_at").
      limit(1)
    }  
  
  def invoice_no_should_exist
    unless invoice_no.blank?
      invoice = Invoice.find_by_invoice_no(invoice_no)
      if invoice.nil?
        errors.add(:invoice_no, " is invalid!")
      end
    end
  end
  
  def isbn_should_be_part_of_invoice
    unless isbn.blank?
      item = Invoice.find_by_invoice_no_and_isbn(invoice_no, isbn)
      if item.nil?
        errors.add(:isbn, " is invalid!");
      end
    end
  end
  
  def excess_quantity
    invoice = Invoice.find_by_invoice_no_and_isbn(invoice_no, isbn)
    if invoice.received_cnt == invoice.quantity
      errors.add(:isbn, "'s quantity has already been received!")
    end
  end
  
  private  
    def mark_receipt_in_invoice
      item = Invoice.find_by_invoice_no_and_isbn(invoice_no, isbn)
      item.received_cnt = item.received_cnt + 1
      item.save
      
      self.invoice_id = item.id
    end
end
