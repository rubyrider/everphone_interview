class Employee < ApplicationRecord
  validates :name, presence: true
  
  has_many :interests, class_name: 'Taxonomy', as: :taxon_able
end
