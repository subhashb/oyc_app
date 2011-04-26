# == Schema Information
# Schema version: 20110426071048
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
#

class Bookfair < ActiveRecord::Base
end
