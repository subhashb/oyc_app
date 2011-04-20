class AddSupplierIdToInvoices < ActiveRecord::Migration
  def self.up
    add_column :invoices, :supplier_id, :integer
  end

  def self.down
    remove_column :invoices, :supplier_id
  end
end
