class AddUniqueIndexOnNameAndUserIdToInsurers < ActiveRecord::Migration[5.0]
  def change
    add_index :insurers, [:name, :user_id], unique: true
  end
end
