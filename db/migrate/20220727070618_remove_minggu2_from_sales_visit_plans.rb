class RemoveMinggu2FromSalesVisitPlans < ActiveRecord::Migration[5.2]
  def change
    remove_column :sales_visit_plans, :minggu2, :boolean
  end
end
