class AddKontakPersonilToStatusReports < ActiveRecord::Migration[5.2]
  def change
    add_column :status_reports, :kontak_personil, :string
  end
end
