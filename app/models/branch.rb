# == Schema Information
# Schema version: 20110420043817
#
# Table name: branches
#
#  id          :decimal(, )     primary key
#  name        :string(298)
#  address     :string(1000)
#  city        :string(50)
#  phone       :string(255)
#  email       :string(100)
#  category    :string(1)       not null
#  parent_id   :decimal(, )
#  parent_name :string(255)
#  card_id     :string(16)
#

class Branch < ActiveRecord::Base
  has_and_belongs_to_many :plans
  has_and_belongs_to_many :coupons

  def self.branch_id_from_subdomain(subdomain)
    # replace this by searching for a parent branch with subdomain set in the short name
    # TODO
    id = case subdomain
          when 'wf'   then 1
          when 'jpn'  then 2
          when 'bll'  then 3
          when 'in'   then 4
          when 'kn'   then 7
          when 'hsr'  then 8
          when 'ft'   then 10
          when 'kor'  then 11
          when 'jn'   then 14
          when 'ne'   then 15
          when 'rmv'  then 16
          when 'dmb'  then 19
          when 'aun'  then 20
          when 'ecil' then 21
          when 'mlm'  then 25
          when 'vij'  then 26
          when 'vjn'  then 31
          when 'rrn'  then 33
          when 'skn'  then 35
          when 'wan'  then 36  
          else 801
          end
    id
  end
  
  def self.branch_name_from_subdomain(subdomain)
    find(branch_id_from_subdomain(subdomain)).name
  end
  
  def self.branch_from_subdomain(subdomain)
    find(branch_id_from_subdomain(subdomain))
  end
  
  def self.associate_branches(subdomain)
    branch_id = branch_id_from_subdomain(subdomain)
    if branch_id == 801
      find(:all, :conditions => ['category IN(? , ?, ?)', 'H','W','T'])
    else
      find(:all, :conditions => ['parent_id = ?', branch_id])
    end
  end
  
  def self.strata_branches 
    find(:all, :conditions => ['category IN(? , ?, ?)', 'H','W','T'])
  end

end
