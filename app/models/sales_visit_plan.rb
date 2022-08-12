class SalesVisitPlan < ApplicationRecord
  belongs_to :category
  # has_many :realization_visit_plan
  has_many_attached :file_lampiran
end
