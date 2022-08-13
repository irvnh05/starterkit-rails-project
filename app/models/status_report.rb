class StatusReport < ApplicationRecord
  belongs_to :realization_visit_plan
  # filename = RealizationVisitPlan.file_lampiran.filename
  # , dependent: :destroy
  # has_many_attached :file_lampiran
end
