class EmployeeGift < ActiveRecord::Migration[6.1]
  def change
    create_table :employees_gifts do |t|
      t.references :employee
      
      t.references :gift
    end
  end
end
