class AddWorkUnitToContacts < ActiveRecord::Migration[5.2]
  def change
    add_reference :contacts, :work_unit, foreign_key: true
  end
end
