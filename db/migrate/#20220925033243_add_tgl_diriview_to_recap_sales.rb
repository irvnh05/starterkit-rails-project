class AddTglDiriviewToRecapSales < ActiveRecord::Migration[5.2]
  def change
    add_column :recap_sales, :tgl_direview, :date
  end
end
