class AddRoleIdToContacts < ActiveRecord::Migration[5.2]
  def change
    add_reference :contacts, :roles, foreign_key: true
  end
end
