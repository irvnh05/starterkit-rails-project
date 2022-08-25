class AddProjectPotentialIdToRealizationVisitPlans < ActiveRecord::Migration[5.2]
  def change
    add_reference :realization_visit_plans, :project_potential, foreign_key: true
  end
end
