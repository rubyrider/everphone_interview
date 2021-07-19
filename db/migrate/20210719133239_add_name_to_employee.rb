class AddNameToEmployee < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :Name, :string, null: false
  end
end
