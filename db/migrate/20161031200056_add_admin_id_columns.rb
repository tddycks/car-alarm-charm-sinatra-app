class AddAdminIdColumns < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :admin_id, :integer
    add_column :events, :admin_id, :integer
    add_column :comments, :admin_id, :integer
  end
end
