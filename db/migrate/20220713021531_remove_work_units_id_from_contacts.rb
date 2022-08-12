class RemoveWorkUnitsIdFromContacts < ActiveRecord::Migration[5.2]
  def change
    remove_column :contacts, :work_units_id, :bigint
  end
end
