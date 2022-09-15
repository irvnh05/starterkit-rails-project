class AddJabatanYangDikunjungiToStatusReports < ActiveRecord::Migration[5.2]
  def change
    add_column :status_reports, :jabatan_yang_dikunjungi, :string
  end
end
