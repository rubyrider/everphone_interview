class GiftSuggestionFinder
  attr_reader :employee
  
  def initialize(employee)
    @employee ||= employee
  end
  
  def suggest
    # if employee already have a gift lets not suggest anything!
    return [] if employee.gifts.present?
    
    suggest_gifts
  end
  
  private
    # Avoid n+1 query
    # Caching for to avoid redundancy
    def employee_interests
      @employee_interests ||= employee.interests.pluck(:name)
    end
    
    # Avoid n+1 query
    # Caching for to avoid redundancy
    def suggest_gifts
      Rails.cache.fetch(gift_suggestion_cache_key) do
        @suggestion ||= Gift.preload(:categories)
                            .where(categories: { name: employee_interests })
                            .pluck(:name)
      end
    end

    def gift_suggestion_cache_key
      "gift/suggestion/#{employee.cache_key}"
    end
end
