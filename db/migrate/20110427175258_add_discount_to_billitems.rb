class AddDiscountToBillitems < ActiveRecord::Migration
  def self.up
    add_column :billitems, :discount, :float
  end

  def self.down
    remove_column :billitems, :discount
  end
end
