class AddBoroughColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :borough, :string
  end
end
