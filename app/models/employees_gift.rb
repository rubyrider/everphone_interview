class EmployeesGift < ApplicationRecord
  belongs_to :employee
  belongs_to :gift
end
