# == Schema Information
# Schema version: 20110426120952
#
# Table name: bookfairs
#
#  id         :integer(38)     not null, primary key
#  name       :string(255)
#  start_date :datetime
#  end_date   :datetime
#  created_by :integer(38)
#  updated_by :integer(38)
#  created_at :datetime
#  updated_at :datetime
#  active     :string(255)
#

class Bookfair < ActiveRecord::Base
  has_many :bills
  
  scope :active, where(:active => 'Y')
  
  before_save :set_defaults
  
  private
    def set_defaults
      self.active = 'Y'
    end
end
