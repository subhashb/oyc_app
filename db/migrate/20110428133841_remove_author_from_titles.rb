class RemoveAuthorFromTitles < ActiveRecord::Migration
  def self.up
    remove_column :titles, :author
  end

  def self.down
  end
end
