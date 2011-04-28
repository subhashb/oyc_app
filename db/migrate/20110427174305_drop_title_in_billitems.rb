class DropTitleInBillitems < ActiveRecord::Migration
  def self.up
    remove_column :billitems, :title
  end

  def self.down
  end
end
