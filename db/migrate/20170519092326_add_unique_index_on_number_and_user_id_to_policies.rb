class AddUniqueIndexOnNumberAndUserIdToPolicies < ActiveRecord::Migration[5.0]
  def change
    add_index :policies, [:number, :user_id], unique: true
  end
end
