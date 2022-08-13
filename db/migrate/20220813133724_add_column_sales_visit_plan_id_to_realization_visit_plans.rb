class AddColumnSalesVisitPlanIdToRealizationVisitPlans < ActiveRecord::Migration[5.2]
  def change
    add_reference :realization_visit_plans, :sales_visit_plan, foreign_key: true
  end
end
