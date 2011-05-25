class AddGrossamtToBillitems < ActiveRecord::Migration
  def self.up
    add_column :billitems, :grossamt, :float
  end

  def self.down
    remove_column :billitems, :grossamt
  end
end
