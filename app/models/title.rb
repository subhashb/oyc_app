# == Schema Information
# Schema version: 20110426071048
#
# Table name: titles
#
#  id          :integer(38)     not null, primary key
#  isbn        :string(255)
#  title       :string(255)
#  publisher   :string(255)
#  author      :string(255)
#  grossamt    :decimal(, )
#  currency    :string(255)
#  conv_rate   :decimal(, )
#  discount    :decimal(, )
#  netamt      :decimal(, )
#  bookfair_id :integer(38)
#  copies_cnt  :integer(38)
#  sold_cnt    :integer(38)
#  created_by  :integer(38)
#  modified_by :integer(38)
#  created_at  :datetime
#  updated_at  :datetime
#

class Title < ActiveRecord::Base
end
