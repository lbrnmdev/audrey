class AddCommissionAmountToPolicies < ActiveRecord::Migration[5.0]
  def change
    add_column :policies, :commission_amount, :decimal
  end
end
