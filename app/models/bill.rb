# == Schema Information
# Schema version: 20110420151737
#
# Table name: bills
#
#  id              :integer(38)     not null, primary key
#  date_of_billing :datetime
#  amount          :decimal(, )
#  quantity        :integer(38)
#  created_at      :datetime
#  updated_at      :datetime
#  created_by      :integer(38)
#  updated_by      :integer(38)
#

class Bill < ActiveRecord::Base
  before_create :set_date_of_billing
  
  def set_date_of_billing
    if date_of_billing.blank?
      self.date_of_billing = Time.now
    end
  end
end
