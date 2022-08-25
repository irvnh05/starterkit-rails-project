class ProjectPotential < ApplicationRecord
    belongs_to :realization_visit_plan, optional: true
    # has_many :project_potential, dependent: :nullify 
end
