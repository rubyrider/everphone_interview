class CreateGifts < ActiveRecord::Migration[6.1]
  def change
    create_table :gifts do |t|
      t.string :name, null: false, uniq: true

      t.timestamps
    end
    add_index :gifts, :name
  end
end
