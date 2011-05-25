class AddQuantityToBills < ActiveRecord::Migration
  def self.up
    add_column :bills, :quantity, :integer
  end

  def self.down
    remove_column :bills, :quantity
  end
end
