class AddSalesIdToRealizationVisitPlans < ActiveRecord::Migration[5.2]
  def change
    add_column :realization_visit_plans, :sales_id, :string
  end
end
