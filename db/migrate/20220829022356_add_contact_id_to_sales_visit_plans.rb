class AddContactIdToSalesVisitPlans < ActiveRecord::Migration[5.2]
  def change
    add_reference :sales_visit_plans, :contact, foreign_key: true
  end
end
