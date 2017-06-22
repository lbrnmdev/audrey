class AddWebsiteToInsurers < ActiveRecord::Migration[5.0]
  def change
    add_column :insurers, :website, :string
  end
end
