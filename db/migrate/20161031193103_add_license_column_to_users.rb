class AddLicenseColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :license_plate, :string
  end
end
