class AddSupplierIdToTitlereceipts < ActiveRecord::Migration
  def self.up
    add_column :titlereceipts, :supplier_id, :integer
  end

  def self.down
    remove_column :titlereceipts, :supplier_id
  end
end
