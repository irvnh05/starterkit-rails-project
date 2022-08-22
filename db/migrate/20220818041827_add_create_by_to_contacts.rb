class AddCreateByToContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :create_by, :string
  end
end
