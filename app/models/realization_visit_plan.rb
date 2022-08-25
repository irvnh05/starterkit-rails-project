class RealizationVisitPlan < ApplicationRecord
  belongs_to :category
  belongs_to :sales_visit_plan, optional: true
  has_many_attached :file_lampiran
  has_many :status_report, dependent: :destroy
  has_many :project_potential , dependent: :destroy
  # belongs_to :realization_visit_plan
end

