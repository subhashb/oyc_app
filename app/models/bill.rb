# == Schema Information
# Schema version: 20110427092601
#
# Table name: bills
#
#  id              :integer(38)     not null, primary key
#  date_of_billing :datetime
#  grossamt        :decimal(, )
#  quantity        :integer(38)
#  created_at      :datetime
#  updated_at      :datetime
#  created_by      :integer(38)
#  updated_by      :integer(38)
#  netamt          :decimal(, )
#  discount        :decimal(, )
#  bookfair_id     :integer(38)
#

class Bill < ActiveRecord::Base
  belongs_to  :bookfair
  
  has_many    :billitems, :dependent => :destroy
  accepts_nested_attributes_for :billitems, :allow_destroy => :true, :reject_if => lambda { |a| a[:isbn].blank? }
  
  validates :bookfair_id,             :presence => true

  before_create                       :set_date_of_billing
  before_create                       :calculate_amounts
  
  private
    def set_date_of_billing
      if date_of_billing.blank?
        self.date_of_billing = Time.now
      end
    end
    
    def calculate_amounts
    end
end
