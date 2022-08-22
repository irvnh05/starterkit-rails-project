class AddDataCompanyIdByToContacts < ActiveRecord::Migration[5.2]
  def change
    add_reference :contacts, :data_company, foreign_key: true
  end
end
