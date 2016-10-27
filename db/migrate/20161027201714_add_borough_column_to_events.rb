class AddBoroughColumnToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :borough, :string
  end
end
