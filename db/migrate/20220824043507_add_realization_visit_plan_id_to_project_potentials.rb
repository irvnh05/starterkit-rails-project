class AddRealizationVisitPlanIdToProjectPotentials < ActiveRecord::Migration[5.2]
  def change
    add_reference :project_potentials, :realization_visit_plan, foreign_key: true
  end
end
