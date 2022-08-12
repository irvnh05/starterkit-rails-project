class AddEmailUserToContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :email_user, :string
  end
end
