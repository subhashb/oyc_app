class AddBookfairIdToBills < ActiveRecord::Migration
  def self.up
    add_column :bills, :bookfair_id, :integer
  end

  def self.down
    remove_column :bills, :bookfair_id
  end
end
