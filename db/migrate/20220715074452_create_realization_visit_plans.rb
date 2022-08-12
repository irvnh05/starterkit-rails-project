class CreateRealizationVisitPlans < ActiveRecord::Migration[5.2]
  def change
    create_table :realization_visit_plans do |t|
      t.string :nama_entitas_lokasi_pengadaan
      t.string :subjek_deksripsi_pekerjaan
      t.string :cluster
      t.string :realisasi
      t.date :realisasi_tgl_peretemuan
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
