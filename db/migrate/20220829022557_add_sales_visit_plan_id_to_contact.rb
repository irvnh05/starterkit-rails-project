class AddSalesVisitPlanIdToContact < ActiveRecord::Migration[5.2]
  def change
    add_reference :contacts, :sales_visit_plan, foreign_key: true
  end
end
