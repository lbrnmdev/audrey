class AddUniqueIndexOnNumberAndInsurerAndUserToPolicies < ActiveRecord::Migration[5.0]
  def change
    add_index :policies, [:number, :insurer_id, :user_id], unique: true
  end
end
