class AddNetamtToBillitems < ActiveRecord::Migration
  def self.up
    add_column :billitems, :netamt, :float
  end

  def self.down
    remove_column :billitems, :netamt
  end
end
