class AddStatusToRecapSales < ActiveRecord::Migration[5.2]
  def change
    add_column :recap_sales, :status, :string
  end
end
