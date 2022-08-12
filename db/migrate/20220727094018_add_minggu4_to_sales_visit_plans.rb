class AddMinggu4ToSalesVisitPlans < ActiveRecord::Migration[5.2]
  def change
    add_column :sales_visit_plans, :minggu4, :string
  end
end
