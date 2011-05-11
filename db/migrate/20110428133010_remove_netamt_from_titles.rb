class RemoveNetamtFromTitles < ActiveRecord::Migration
  def self.up
    remove_column :titles, :netamt
  end

  def self.down
  end
end
