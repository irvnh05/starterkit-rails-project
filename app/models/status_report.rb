class StatusReport < ApplicationRecord
  belongs_to :realization_visit_plan
  # , dependent: :destroy
  # has_many_attached :file_lampiran
end
