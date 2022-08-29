class AddTindakLanjutToStatusReports < ActiveRecord::Migration[5.2]
  def change
    add_column :status_reports, :tindak_lanjut, :string
  end
end
