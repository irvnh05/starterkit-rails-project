class AddSalesVisitPlanIdToRecapSales < ActiveRecord::Migration[5.2]
  def change
    add_reference :recap_sales, :sales_visit_plan, foreign_key: true
  end
end
