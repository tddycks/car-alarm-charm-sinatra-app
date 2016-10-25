class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :address
      t.string :car_model
      t.string :license_plate
      t.datetime :created_at
    end
  end
end
