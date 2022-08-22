class AddColumnSalesVisitPlanIdToDataCompanies < ActiveRecord::Migration[5.2]
  def change
    add_reference :data_companies, :sales_visit_plan, foreign_key: true
  end
end
