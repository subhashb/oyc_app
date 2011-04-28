class AddConvRateToBillitems < ActiveRecord::Migration
  def self.up
    add_column :billitems, :conv_rate, :float
  end

  def self.down
    remove_column :billitems, :conv_rate
  end
end
