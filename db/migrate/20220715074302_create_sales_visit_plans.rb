class CreateSalesVisitPlans < ActiveRecord::Migration[5.2]
  def change
    create_table :sales_visit_plans do |t|
      t.string :nama_entitas_lokasi_pengadaan
      t.string :jenis_pekerjaan
      t.string :deksripsi_pekerjaan
      t.string :cluster
      t.date :estimasi_tgl_peretemuan
      t.string :nama
      t.boolean :minggu1
      t.boolean :minggu2
      t.boolean :minggu3
      t.boolean :minggu4
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
