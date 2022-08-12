class AddWorkUnitsIdToContacts < ActiveRecord::Migration[5.2]
  def change
    add_reference :contacts, :work_units, foreign_key: true
  end
end
