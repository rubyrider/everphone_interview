class GiftFinderService
  attr_reader :employee_id, :employee
  
  def initialize(employee_id)
    @employee_id = employee_id
  end
  
  def suggest
    # if employee already have a gift lets not suggest anything!
    return [] if employee_gifts.present?

    employee_interests
  end
  
  private
    
    def employee_cache_key
      "employee-#{employee_id}"
    end
    
    def employee_category_cache_key
      "employee-category-cache-key-#{employee_id}"
    end
    
    def employee
      @employee ||= Rails.cache.fetch(employee_cache_key) do
        Employee.preload(:gifts).find(employee_id)
      end
    end
    
    # Avoid n+1 query
    # Caching for to avoid redundancy
    def employee_gifts
      @employee_interests ||= Rails.cache.fetch(employee_cache_key) do
        @employee.preload(:interests).pluck(:name)
      end
    end

    # Avoid n+1 query
    # Caching for to avoid redundancy
    def employee_interests
      @employee_interests ||= Rails.cache.fetch(employee_cache_key) do
        @employee.preload(:interests).pluck(:name)
      end
    end
end
