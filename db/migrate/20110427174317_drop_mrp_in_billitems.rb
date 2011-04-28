class DropMrpInBillitems < ActiveRecord::Migration
  def self.up
    remove_column :billitems, :mrp
  end

  def self.down
  end
end
