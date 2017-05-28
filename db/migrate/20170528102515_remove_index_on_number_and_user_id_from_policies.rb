class RemoveIndexOnNumberAndUserIdFromPolicies < ActiveRecord::Migration[5.0]
  def change
    remove_index :policies, name: :index_policies_on_number_and_user_id
  end
end
