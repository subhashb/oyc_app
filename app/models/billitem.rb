# == Schema Information
# Schema version: 20110513175303
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
#  title_id   :integer(38)
#  grossamt   :decimal(, )
#

class Billitem < ActiveRecord::Base
  belongs_to :bill
  
  validates :isbn,              :presence => true
  
  validate                      :item_exists
  
  before_create                 :populate_data
  after_create                  :update_sold_cnt
  after_create                  :update_bill_totals
  
  def item_exists
    if bill
      title = Title.find_by_bookfair_id_and_isbn(bill.bookfair_id, isbn)
      if title.nil?
        errors.clear
        errors.add(:isbn, " was not part of stock!")
      end
    end
  end
  
  def populate_data
    if bill
      item = Title.next_to_sell(bill.bookfair_id, isbn).first
      if item
        self.title_id = item.id
        isbnItem = Isbn.find_by_isbn(isbn)
        if isbnItem
          self.grossamt = isbnItem.grossamt
          self.conv_rate = get_conv_rate_for(isbnItem.currency)
          grosslocalamt = grossamt * conv_rate
          self.netamt = (grosslocalamt) - (grosslocalamt * discount / 100)
        else
          errors.add(:isbn, " not found!");
        end
      else
        errors.clear
        errors.add(:isbn, " copies have already been sold out!");
      end
    end
  end
  
  private
    def update_sold_cnt
      if bill
        title = Title.find_by_bookfair_id_and_isbn(bill.bookfair_id, isbn)
        if title
          title.sold_cnt = title.sold_cnt + 1
          title.save
        else
          errors.add(:isbn, " - Unable to update Sold Count!")
        end
      end
    end
    
    def update_bill_totals
      if bill
        bill.quantity = bill.quantity + 1
        if bill.grossamt.nil?
          bill.grossamt = grossamt
        else
          bill.grossamt = bill.grossamt + grossamt
        end
        
        if bill.netamt.nil?
          bill.netamt = netamt
        else
          bill.netamt = bill.netamt + netamt
        end
      
        unless bill.save
          puts "Could not save Bill because - " + bill.errors.to_s
        end
      end
    end
    
    def get_conv_rate_for(currency)
      case currency
        when "USD"
          rate = 46.80
        when "GBP"
          rate = 76.90
        when "EUR"
          rate = 67.00
        when "INR"
          rate = 1.00
        else
          rate = -1.00
        end
      return rate
    end
end
