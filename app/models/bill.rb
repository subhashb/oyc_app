# == Schema Information
# Schema version: 20110420095621
#
# Table name: bills
#
#  id              :integer(38)     not null, primary key
#  date_of_billing :datetime
#  amount          :decimal(, )
#  quantity        :integer(38)
#  created_at      :datetime
#  updated_at      :datetime
#

class Bill < ActiveRecord::Base
end
