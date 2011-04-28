class DropInvoiceIdInBillitems < ActiveRecord::Migration
  def self.up
    remove_column :billitems, :invoice_id
  end

  def self.down
  end
end
