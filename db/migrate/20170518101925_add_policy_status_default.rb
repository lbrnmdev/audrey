class AddPolicyStatusDefault < ActiveRecord::Migration[5.0]
  def change
    change_column_default :policies, :status, 0 
  end
end
