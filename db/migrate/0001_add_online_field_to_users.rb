class AddOnlineFieldToUsers < ActiveRecord::Migration
  def up
    add_column :users, :last_action, :datetime
  end

  def down
    remove_column :users, :last_action
  end
end
