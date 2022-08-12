class Contact < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :work_unit, optional: true
  belongs_to :user, optional: true
end
