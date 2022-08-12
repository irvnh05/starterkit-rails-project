class AddMingguKunjunganToSalesVisitPlans < ActiveRecord::Migration[5.2]
  def change
    add_column :sales_visit_plans, :minggu_kunjungan, :string
  end
end
