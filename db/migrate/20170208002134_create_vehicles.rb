class CreateVehicles < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicles do |t|
      t.references :client, foreign_key: true
      t.string :registration_no
      t.string :chassis_no
      t.string :make
      t.string :model
      t.integer :year_of_manufacture
      t.string :cubic_capacity
      t.integer :seating_capacity
      t.string :body_type

      t.timestamps
    end
    add_index :vehicles, :registration_no
    add_index :vehicles, :chassis_no
  end
end
