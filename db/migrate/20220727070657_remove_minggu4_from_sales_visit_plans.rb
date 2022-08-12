class RemoveMinggu4FromSalesVisitPlans < ActiveRecord::Migration[5.2]
  def change
    remove_column :sales_visit_plans, :minggu4, :boolean
  end
end
