class AddNominalUsdToProjectPotentials < ActiveRecord::Migration[5.2]
  def change
    add_column :project_potentials, :nominal_usd, :integer, limit: 8
  end
end
