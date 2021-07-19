class CreateTaxonomies < ActiveRecord::Migration[6.1]
  def change
    create_table :taxonomies do |t|
      t.string :name
      t.references :taxon_able, polymorphic: true, null: false

      t.timestamps
    end
    add_index :taxonomies, :name
  end
end
