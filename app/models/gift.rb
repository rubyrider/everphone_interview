class Gift < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  
  has_many :categories, class_name: 'Taxonomy', as: :taxon_able

  has_and_belongs_to_many :employees, join_table: 'employees_gifts'
end
