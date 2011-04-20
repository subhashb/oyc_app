class ChangeReceivedCntInInvoices < ActiveRecord::Migration
  def self.up
    change_column :invoices, :received_cnt, :integer, {:default => 0}
  end

  def self.down
  end
end
