class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.references :category, foreign_key: true
      t.string :cluster
      t.string :nama_entitas
      t.string :satuan_kerja
      t.string :lokasi_kerja
      t.string :nama_pic
      t.string :jabatan_pic
      t.string :emaiil_pic
      # t.string :kontak_pic
      t.string :keterangan

      t.timestamps
    end
  end
end
