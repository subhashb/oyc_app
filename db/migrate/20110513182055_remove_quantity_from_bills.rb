class RemoveQuantityFromBills < ActiveRecord::Migration
  def self.up
    remove_column :bills, :quantity
  end

  def self.down
  end
end
