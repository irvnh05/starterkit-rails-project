class AddColumnTglDireviewToStatusReports < ActiveRecord::Migration[5.2]
  def change
    add_column :status_reports, :tgl_direview, :date
  end
end
