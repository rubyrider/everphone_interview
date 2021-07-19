class Gift < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  
  has_many :categories, class_name: 'Taxonomy', as: :taxon_able
end
