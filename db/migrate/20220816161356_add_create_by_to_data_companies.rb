class AddCreateByToDataCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :data_companies, :create_by, :string
  end
end
