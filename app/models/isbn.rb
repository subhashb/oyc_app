# == Schema Information
# Schema version: 20110427172414
#
# Table name: isbns
#
#  id         :integer(38)     not null, primary key
#  isbn       :string(255)
#  title      :string(255)
#  author     :string(255)
#  publisher  :string(255)
#  grossamt   :decimal(, )
#  currency   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Isbn < ActiveRecord::Base
end
