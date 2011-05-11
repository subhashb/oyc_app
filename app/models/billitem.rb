# == Schema Information
# Schema version: 20110428173957
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
#

class Billitem < ActiveRecord::Base
  belongs_to :bill
  
  validates :isbn,              :presence => true
  validates :bill_id,           :presence => true
  
  validate                      :item_exists
  
  after_validation              :populate_data
  after_create                  :update_sold_cnt
  
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
end
