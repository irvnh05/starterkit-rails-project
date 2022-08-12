class Category < ApplicationRecord
    # has_many :contacts, dependent: :destroy
    has_many :data_companies, dependent: :destroy
end
