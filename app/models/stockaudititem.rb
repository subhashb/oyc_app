# == Schema Information
# Schema version: 20110426071048
#
# Table name: stockaudititems
#
#  id          :integer(38)     not null, primary key
#  bookfair_id :integer(38)
#  isbn        :string(255)
#  created_by  :integer(38)
#  modified_by :integer(38)
#  created_at  :datetime
#  updated_at  :datetime
#

class Stockaudititem < ActiveRecord::Base
  validates :isbn,              :presence => true
  validates :bookfair_id,       :presence => true
end
