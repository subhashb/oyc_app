class AddTitleIdToBillitems < ActiveRecord::Migration
  def self.up
    add_column :billitems, :title_id, :integer
  end

  def self.down
    remove_column :billitems, :title_id
  end
end
