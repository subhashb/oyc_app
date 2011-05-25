class RemoveDiscountFromBills < ActiveRecord::Migration
  def self.up
    remove_column :bills, :discount
  end

  def self.down
  end
end
