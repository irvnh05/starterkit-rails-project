class CreateDataProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :data_projects do |t|
      t.string :project_code
      t.string :project_name
      t.string :location

      t.timestamps
    end
  end
end
