class AddBoxNoInTitlereceipts < ActiveRecord::Migration
  def self.up
    add_column :titlereceipts, :box_no, :integer
  end

  def self.down
    remove_column :titlereceipts, :box_no
  end
end
