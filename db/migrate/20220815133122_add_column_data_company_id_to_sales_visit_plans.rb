class AddColumnDataCompanyIdToSalesVisitPlans < ActiveRecord::Migration[5.2]
  def change
    add_reference :sales_visit_plans, :data_company, foreign_key: true
  end
end
