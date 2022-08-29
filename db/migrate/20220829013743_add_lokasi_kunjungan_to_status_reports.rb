class AddLokasiKunjunganToStatusReports < ActiveRecord::Migration[5.2]
  def change
    add_column :status_reports, :lokasi_kunjungan, :string
  end
end
