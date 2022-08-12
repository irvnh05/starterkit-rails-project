class AddKeteranganToDataCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :data_companies, :keterangan, :string
  end
end
