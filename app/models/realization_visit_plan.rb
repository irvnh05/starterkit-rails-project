class RealizationVisitPlan < ApplicationRecord
  belongs_to :category
  # belongs_to :sales_visit_plan
  has_many :status_report, dependent: :destroy
end

