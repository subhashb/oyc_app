class RemoveSoldCntFromInvoices < ActiveRecord::Migration
  def self.up
    remove_column :invoices, :sold_cnt
  end

  def self.down
  end
end
