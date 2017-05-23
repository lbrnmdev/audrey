class CreateInsurers < ActiveRecord::Migration[5.0]
  def change
    create_table :insurers do |t|
      t.string :name
      t.string :full_legal_name
      t.string :address
      t.string :email_address
      t.string :phone_number
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
