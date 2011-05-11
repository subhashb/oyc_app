class RemoveTitleFromTitles < ActiveRecord::Migration
  def self.up
    remove_column :titles, :title
  end

  def self.down
  end
end
