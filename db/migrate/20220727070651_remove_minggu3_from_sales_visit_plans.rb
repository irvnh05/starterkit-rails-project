class RemoveMinggu3FromSalesVisitPlans < ActiveRecord::Migration[5.2]
  def change
    remove_column :sales_visit_plans, :minggu3, :boolean
  end
end
