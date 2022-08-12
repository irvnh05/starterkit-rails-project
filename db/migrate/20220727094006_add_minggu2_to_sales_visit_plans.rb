class AddMinggu2ToSalesVisitPlans < ActiveRecord::Migration[5.2]
  def change
    add_column :sales_visit_plans, :minggu2, :string
  end
end
