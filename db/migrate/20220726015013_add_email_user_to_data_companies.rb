class AddEmailUserToDataCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :data_companies, :email_user, :string
  end
end
