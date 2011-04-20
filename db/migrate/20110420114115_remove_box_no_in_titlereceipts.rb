class RemoveBoxNoInTitlereceipts < ActiveRecord::Migration
  def self.up
    remove_column :titlereceipts, :box_no
  end

  def self.down
  end
end
