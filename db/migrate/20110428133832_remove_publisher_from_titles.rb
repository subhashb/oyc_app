class RemovePublisherFromTitles < ActiveRecord::Migration
  def self.up
    remove_column :titles, :publisher
  end

  def self.down
  end
end
