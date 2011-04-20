class AddInvoiceIdToTitlereceipts < ActiveRecord::Migration
  def self.up
    add_column :titlereceipts, :invoice_id, :integer
  end

  def self.down
    remove_column :titlereceipts, :invoice_id
  end
end
