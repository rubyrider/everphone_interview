class Employee < ApplicationRecord
  validates :name, presence: true

  has_many :interests, class_name: 'Taxonomy', as: :taxon_able

  has_and_belongs_to_many :gifts, join_table: 'employees_gifts', limit: 1
end
