class AddRolesIdToDataCompanies < ActiveRecord::Migration[5.2]
  def change
    add_reference :data_companies, :roles, foreign_key: true
  end
end
