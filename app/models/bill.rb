# == Schema Information
# Schema version: 20110525064617
#
# Table name: bills
#
#  id              :integer(38)     not null, primary key
#  date_of_billing :datetime
#  created_at      :datetime
#  updated_at      :datetime
#  created_by      :integer(38)
#  updated_by      :integer(38)
#  bookfair_id     :integer(38)     not null
#  grossamt        :decimal(, )
#  quantity        :integer(38)
#  netamt          :decimal(, )
#

class Bill < ActiveRecord::Base
  belongs_to  :bookfair
  
  has_many    :billitems, :dependent => :destroy
  accepts_nested_attributes_for :billitems, :allow_destroy => :true, :reject_if => lambda { |a| a[:isbn].blank? }
  
  validates :bookfair_id,             :presence => true

  before_create                       :set_defaults
  
  private
    def set_defaults
      if date_of_billing.blank?
        self.date_of_billing = Time.now
      end
      if self.quantity.blank?
		    self.quantity = 0
		    self.grossamt = 0.0
		    self.netamt = 0.0
	    end      
    end
end
