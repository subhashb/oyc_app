class RemoveGrossamtFromTitles < ActiveRecord::Migration
  def self.up
    remove_column :titles, :grossamt
  end

  def self.down
  end
end
