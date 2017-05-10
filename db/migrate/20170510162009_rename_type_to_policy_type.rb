class RenameTypeToPolicyType < ActiveRecord::Migration[5.0]
  def change
    rename_column :policies, :type, :policy_type
  end
end
