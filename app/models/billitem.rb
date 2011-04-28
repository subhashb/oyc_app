# == Schema Information
# Schema version: 20110427175306
#
# Table name: billitems
#
#  id         :integer(38)     not null, primary key
#  isbn       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  bill_id    :integer(38)
#  conv_rate  :decimal(, )
#  discount   :decimal(, )
#  netamt     :decimal(, )
#

class Billitem < ActiveRecord::Base
  belongs_to :invoice
  
  before_validation             :populate_data
  
  validates :isbn,              :presence => true
  
  validate                      :item_exists_in_invoices
  validate                      :item_was_received
  
  after_create                  :update_sold_cnt
  
  def populate_data
    item = Invoice.next_to_sell(isbn).first
    if item
      self.title = item.title
      self.mrp = item.grossamt
      self.invoice_id = item.id
    else
      errors.add(:isbn, " copies have already been sold out!");
    end
  end
  
  def item_exists_in_invoices
    invoices = Invoice.find_by_isbn(isbn)
    if invoices.nil?
      errors.clear
      errors.add(:isbn, " was not part of stock!")
    end
  end
  
  def item_was_received
    unless invoice_id.blank?
      invoice_no = Invoice.find(invoice_id).invoice_no
      title = Titlereceipt.find_by_invoice_no_and_isbn(invoice_no, isbn)
      if title.nil?
        errors.add(:isbn, " was not received!")
      end
    end
  end
  
  private
    def update_sold_cnt
      invoice = Invoice.find(invoice_id)
      if invoice
        invoice.sold_cnt = invoice.sold_cnt + 1
        invoice.save
      end
    end
end
