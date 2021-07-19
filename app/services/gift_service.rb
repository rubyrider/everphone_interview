class GiftService
  attr_reader :employee_id

  def initialize(employee_id)
    @employee_id = employee_id
  end

  def assign
    return gifts if gifts.present?
    return [] if suggested_gifts.empty?

    remove_caches

    ActiveRecord::Base.transaction do
      employee.gifts << suggested_gifts.first
    end

    employee.gifts
  end

  private

  def gifts
    @gifts ||= employee.gifts
  end

  def remove_caches
    Rails.cache.delete(EmployeesGift.collection_cache_key)
    Rails.cache.delete("gift/suggestion/#{employee.cache_key}")
    Rails.cache.delete(employee.cache_key)
  end

  def suggested_gifts
    @suggested_gifts ||= GiftSuggestionFinder.new(employee).suggest
  end

  def employee
    @employee ||= Employee.preload(:interests, :gifts).find(employee_id)
  end
end
