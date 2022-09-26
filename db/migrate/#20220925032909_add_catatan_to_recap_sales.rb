class AddCatatanToRecapSales < ActiveRecord::Migration[5.2]
  def change
    add_column :recap_sales, :catatan, :string
  end
end
