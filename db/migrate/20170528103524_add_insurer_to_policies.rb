class AddInsurerToPolicies < ActiveRecord::Migration[5.0]
  def change
    add_reference :policies, :insurer, foreign_key: true
  end
end
