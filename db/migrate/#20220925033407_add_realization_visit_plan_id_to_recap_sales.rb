class AddRealizationVisitPlanIdToRecapSales < ActiveRecord::Migration[5.2]
  def change
    add_reference :recap_sales, :realization_visit_plan, foreign_key: true
  end
end
