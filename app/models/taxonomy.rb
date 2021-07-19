class Taxonomy < ApplicationRecord
  belongs_to :taxon_able, polymorphic: true
end
