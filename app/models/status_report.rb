class StatusReport < ApplicationRecord
  belongs_to :realization_visit_plan , optional: true
  # belongs_to :sales_visit_plan, optional: true 
  
  # belongs_to :data_company
  # belongs_to :contact
  # filename = RealizationVisitPlan.file_lampiran.filename
  # , dependent: :destroy
  # has_many_attached :file_lampiran
end
