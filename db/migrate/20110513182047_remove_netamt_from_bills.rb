class RemoveNetamtFromBills < ActiveRecord::Migration
  def self.up
    remove_column :bills, :netamt
  end

  def self.down
  end
end
