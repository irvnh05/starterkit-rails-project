class AddContactIdToStatusReports < ActiveRecord::Migration[5.2]
  def change
    add_reference :status_reports, :contact, foreign_key: true
  end
end
