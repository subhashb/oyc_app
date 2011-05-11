class AddInvoiceIdToTitles < ActiveRecord::Migration
  def self.up
    add_column :titles, :invoice_id, :integer
  end

  def self.down
    remove_column :titles, :invoice_id
  end
end
