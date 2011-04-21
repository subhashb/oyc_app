class AddUserIdsInBills < ActiveRecord::Migration
  def self.up
    add_column :bills, :created_by, :integer
    add_column :bills, :updated_by, :integer
  end

  def self.down
    remove_column :bills, :created_by
    remove_column :bills, :updated_by
  end
end
