class CreateRecapSales < ActiveRecord::Migration[5.2]
  def change
    create_table :recap_sales do |t|

      t.timestamps
    end
  end
end
