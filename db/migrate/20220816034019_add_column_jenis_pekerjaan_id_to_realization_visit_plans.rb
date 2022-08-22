class AddColumnJenisPekerjaanIdToRealizationVisitPlans < ActiveRecord::Migration[5.2]
  def change
    add_column :realization_visit_plans, :jenis_pekerjaan, :string
  end
end
