class AddRolesIdToRecapSales < ActiveRecord::Migration[5.2]
  def change
    add_reference :recap_sales, :roles, foreign_key: true
  end
end
