class AddMinggu1ToSalesVisitPlans < ActiveRecord::Migration[5.2]
  def change
    add_column :sales_visit_plans, :minggu1, :string
  end
end
