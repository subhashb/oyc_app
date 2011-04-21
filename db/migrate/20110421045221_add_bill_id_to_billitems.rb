class AddBillIdToBillitems < ActiveRecord::Migration
  def self.up
    add_column :billitems, :bill_id, :integer
  end

  def self.down
    remove_column :billitems, :bill_id
  end
end
