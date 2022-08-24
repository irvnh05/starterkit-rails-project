class AddReviewByToRealizationVisitPlans < ActiveRecord::Migration[5.2]
  def change
    add_column :realization_visit_plans, :review_by, :string
  end
end
