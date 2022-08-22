class AddContactIdByToDataCompanies < ActiveRecord::Migration[5.2]
  def change
    add_reference :data_companies, :contact, foreign_key: true
  end
end
