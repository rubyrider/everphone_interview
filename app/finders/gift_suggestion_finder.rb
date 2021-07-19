class GiftSuggestionFinder
  attr_reader :employee

  def initialize(employee)
    @employee = employee
  end

  def suggest
    # if employee already have a gift lets not suggest anything!
    return [] if employee.gifts.present?

    @suggest ||= suggest_gifts
  end

  private

  def employee_interests
    @employee_interests ||= employee.interests.pluck(:name)
  end

  def suggest_gifts
    Gift.joins(join_queries).where(taxonomies: {name: employee_interests})
  end

  def join_queries
    "INNER JOIN taxonomies ON taxonomies.taxon_able_id = gifts.id AND taxonomies.taxon_able_type = 'Gift'"
  end

  def gift_suggestion_cache_key
    "gift/suggestion/#{employee.cache_key}"
  end
end
