class AddRolesIdToRealizationVisitPlans < ActiveRecord::Migration[5.2]
  def change
    add_reference :realization_visit_plans, :roles, foreign_key: true
  end
end
