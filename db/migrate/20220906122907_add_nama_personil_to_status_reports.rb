class AddNamaPersonilToStatusReports < ActiveRecord::Migration[5.2]
  def change
    add_column :status_reports, :nama_personil, :string
  end
end
