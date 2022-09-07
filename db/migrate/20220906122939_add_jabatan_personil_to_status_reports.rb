class AddJabatanPersonilToStatusReports < ActiveRecord::Migration[5.2]
  def change
    add_column :status_reports, :jabatan_personil, :string
  end
end
