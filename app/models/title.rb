# == Schema Information
# Schema version: 20110428133901
#
# Table name: titles
#
#  id          :integer(38)     not null, primary key
#  isbn        :string(255)
#  bookfair_id :integer(38)
#  copies_cnt  :integer(38)
#  sold_cnt    :integer(38)
#  created_by  :integer(38)
#  modified_by :integer(38)
#  created_at  :datetime
#  updated_at  :datetime
#  invoice_id  :integer(38)
#

class Title < ActiveRecord::Base
  belongs_to :invoice
  has_one :isbnitem, :foreign_key => "isbn", :primary_key => "isbn", :class_name => "Isbn"
  
  scope :next_to_sell, lambda { |bookfair_id, isbn|
      where("bookfair_id = :bookfair_id AND isbn = :isbn AND sold_cnt<received_cnt", {:bookfair_id => bookfair_id, :isbn => isbn}).
      order(:id).
      limit(1)
    } 
end
