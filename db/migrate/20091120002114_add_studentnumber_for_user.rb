class AddStudentnumberForUser < ActiveRecord::Migration
  def self.up
    add_column :users, :studentnumber, :string
  end

  def self.down
    remove_column :users, :studentnumber
  end
end
