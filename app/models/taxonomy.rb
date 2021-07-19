class Taxonomy < ApplicationRecord
  belongs_to :taxon_able, polymorphic: true
  belongs_to :employee, inverse_of: :interests, foreign_key: :taxon_able_id, optional: true
end
