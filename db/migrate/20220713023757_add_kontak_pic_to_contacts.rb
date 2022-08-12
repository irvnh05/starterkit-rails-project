class AddKontakPicToContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :kontak_pic, :string
  end
end
