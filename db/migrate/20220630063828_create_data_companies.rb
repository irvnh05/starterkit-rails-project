class CreateDataCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :data_companies do |t|
      t.references :category, foreign_key: true
      t.string :cluster
      t.string :nama_entitas
      t.string :area
      t.string :lokasi_kerja
      t.string :alamat
      t.string :website
      t.string :daftar_pekerjaan

      t.timestamps
    end
  end
end
