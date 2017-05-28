class AddUniqueIndexOnFullLegalNameAndUserIdToInsurers < ActiveRecord::Migration[5.0]
  def change
    add_index :insurers, [:full_legal_name, :user_id], unique: true
  end
end
