class AddIsDeletedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_deleted, :boolean, default: false
  end
end
