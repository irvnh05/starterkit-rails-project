class SalesVisitPlan < ApplicationRecord
  belongs_to :category
  # has_many :data_company, dependent: :nullify 
  belongs_to :data_company, optional: true
  # , optional:true
  has_many :realization_visit_plan , dependent: :destroy
  has_many_attached :file_lampiran
  has_many :status_report
  # , dependent: :destroy
end
