class AddKontakYangDikunjungiToStatusReports < ActiveRecord::Migration[5.2]
  def change
    add_column :status_reports, :kontak_yang_dikunjungi, :string
  end
end
