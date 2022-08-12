class AddMinggu3ToSalesVisitPlans < ActiveRecord::Migration[5.2]
  def change
    add_column :sales_visit_plans, :minggu3, :string
  end
end
