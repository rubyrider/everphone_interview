class GiftService
  attr_reader :employee_id

  def initialize(employee_id)
    @employee_id = employee_id
  end

  def assign
    return false if employee.gifts.present?

    ActiveRecord::Base.transaction do
      employee.gifts << suggested_gifts.first
    end
  end

  private

  def suggested_gifts
    @suggested_gifts ||= GiftSuggestionFinder.new(employee).suggest
  end

  def employee
    @employee ||= Employee.find(employee_id)
  end
end
