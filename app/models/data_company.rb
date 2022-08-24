class DataCompany < ApplicationRecord
  belongs_to :category,  optional:true
  # belongs_to :sales_visit_plan,  optional:true
  has_many :status_report
  has_many :sales_visit_plan, dependent: :nullify 
  belongs_to :contact

  
end
