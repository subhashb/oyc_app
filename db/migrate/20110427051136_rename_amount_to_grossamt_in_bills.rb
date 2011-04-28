class RenameAmountToGrossamtInBills < ActiveRecord::Migration
  def self.up
    rename_column :bills, :amount, :grossamt
  end

  def self.down
    rename_column :bills, :grossamt, :amount
  end
end
