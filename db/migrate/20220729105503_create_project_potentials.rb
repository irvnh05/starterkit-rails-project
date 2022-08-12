class CreateProjectPotentials < ActiveRecord::Migration[5.2]
  def change
    create_table :project_potentials do |t|
      t.string :nama_entitas
      t.string :cluster
      t.string :lokasi
      t.string :judul_tender
      t.string :nilai
      t.integer :nominal
      t.string :lini_bisnis
      t.date :jadwal_perkiraan_tender
      t.integer :durasi_proyek
      t.string :remark
      t.string :konfirmasi
      t.string :informasi_tambahan

      t.timestamps
    end
  end
end
