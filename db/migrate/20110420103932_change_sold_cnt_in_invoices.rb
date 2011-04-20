class ChangeSoldCntInInvoices < ActiveRecord::Migration
  def self.up
    change_column :invoices, :sold_cnt, :integer, {:default => 0}
  end

  def self.down
  end
end
