class AddEmailUserToRealizationVisitPlans < ActiveRecord::Migration[5.2]
  def change
    add_column :realization_visit_plans, :email_user, :string
  end
end
