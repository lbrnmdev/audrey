class AddUserToPolicies < ActiveRecord::Migration[5.0]
  def change
    add_reference :policies, :user, foreign_key: true
  end
end
