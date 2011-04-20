# == Schema Information
# Schema version: 20110420095621
#
# Table name: billitems
#
#  id         :integer(38)     not null, primary key
#  isbn       :string(255)
#  title      :string(255)
#  mrp        :decimal(, )
#  created_at :datetime
#  updated_at :datetime
#

class Billitem < ActiveRecord::Base
end
