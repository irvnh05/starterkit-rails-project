class Contact < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :work_unit, optional: true
  belongs_to :user, optional: true
  has_many :status_report
  has_many :data_company , dependent: :destroy
  has_many :sales_visit_plan, dependent: :nullify
  has_many_attached :file_lampiran
end
