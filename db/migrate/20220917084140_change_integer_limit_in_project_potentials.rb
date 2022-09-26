class ChangeIntegerLimitInProjectPotentials < ActiveRecord::Migration[5.2]
  def change
    change_column :project_potentials, :nominal, :integer, limit: 8
  end 
end
