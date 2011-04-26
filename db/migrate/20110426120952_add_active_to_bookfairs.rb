class AddActiveToBookfairs < ActiveRecord::Migration
  def self.up
    add_column :bookfairs, :active, :string
  end

  def self.down
    remove_column :bookfairs, :active
  end
end
