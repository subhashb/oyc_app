class RemoveGrossamtFromBills < ActiveRecord::Migration
  def self.up
    remove_column :bills, :grossamt
  end

  def self.down
  end
end
