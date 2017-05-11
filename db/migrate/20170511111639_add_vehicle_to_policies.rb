class AddVehicleToPolicies < ActiveRecord::Migration[5.0]
  def change
    add_reference :policies, :vehicle, foreign_key: true
  end
end
