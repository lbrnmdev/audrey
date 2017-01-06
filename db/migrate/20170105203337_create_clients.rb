class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :lastname
      t.string :other_names
      t.string :address
      t.string :telephone
      t.string :email
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
