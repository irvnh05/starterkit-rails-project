class AddTglDireviewByToRealizationVisitPlans < ActiveRecord::Migration[5.2]
  def change
    add_column :realization_visit_plans, :tgl_direview, :string
  end
end
