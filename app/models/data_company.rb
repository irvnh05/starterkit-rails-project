class DataCompany < ApplicationRecord
  belongs_to :category
  has_many :sales_visit_plan
  has_many :status_report
  
end
