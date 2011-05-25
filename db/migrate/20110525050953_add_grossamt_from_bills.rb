class AddGrossamtFromBills < ActiveRecord::Migration
  def self.up
    add_column :bills, :grossamt, :float
  end

  def self.down
    remove_column :bills, :grossamt
  end
end
