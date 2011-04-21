class AddInvoiceIdToBillitems < ActiveRecord::Migration
  def self.up
    add_column :billitems, :invoice_id, :integer
  end

  def self.down
    remove_column :billitems, :invoice_id
  end
end
