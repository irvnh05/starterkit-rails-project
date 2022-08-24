class AddTglDireviewByToSalesVisitPlans < ActiveRecord::Migration[5.2]
  def change
    add_column :sales_visit_plans, :tgl_direview, :string
  end
end
