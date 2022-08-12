class CreateStatusReports < ActiveRecord::Migration[5.2]
  def change
    create_table :status_reports do |t|
      t.string :catatan
      t.string :hasil_kunjungan
      t.date :tgl_aktivitas
      t.references :realization_visit_plan, foreign_key: true
    end
  end
end
