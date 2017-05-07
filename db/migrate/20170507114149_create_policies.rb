class CreatePolicies < ActiveRecord::Migration[5.0]
  def change
    create_table :policies do |t|
      t.string :number
      t.references :client, foreign_key: true
      t.string :type
      t.integer :status
      t.date :issue_date
      t.date :start_date
      t.date :end_date
      t.decimal :premium
      t.decimal :commission
      t.decimal :discount

      t.timestamps
    end
  end
end
