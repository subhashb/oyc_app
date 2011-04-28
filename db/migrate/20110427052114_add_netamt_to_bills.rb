class AddNetamtToBills < ActiveRecord::Migration
  def self.up
    add_column :bills, :netamt, :float
  end

  def self.down
    remove_column :bills, :netamt
  end
end
