class CreateTypeWorkers < ActiveRecord::Migration[5.2]
  def change
    create_table :type_workers do |t|
      t.string :name

      t.timestamps
    end
  end
end
