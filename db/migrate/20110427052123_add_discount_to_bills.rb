class AddDiscountToBills < ActiveRecord::Migration
  def self.up
    add_column :bills, :discount, :float
  end

  def self.down
    remove_column :bills, :discount
  end
end
