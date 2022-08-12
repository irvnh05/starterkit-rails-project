class RemoveMinggu1FromSalesVisitPlans < ActiveRecord::Migration[5.2]
  def change
    remove_column :sales_visit_plans, :minggu1, :boolean
    
  end
end
