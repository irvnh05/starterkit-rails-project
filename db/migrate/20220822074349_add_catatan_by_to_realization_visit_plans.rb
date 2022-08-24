class AddCatatanByToRealizationVisitPlans < ActiveRecord::Migration[5.2]
  def change
    add_column :realization_visit_plans, :catatan, :string
  end
end
