class AddNamaYangDikunjungiToStatusReports < ActiveRecord::Migration[5.2]
  def change
    add_column :status_reports, :nama_yang_dikunjungi, :string
  end
end
