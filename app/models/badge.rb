class Badge < ApplicationRecord

  has_many :received_badge
  has_many :users, through: :received_badge
  
  
  TYPES = %i[
      by_category
      by_success_passing_on_the_first_try
      by_success_passing_all_tests_of_certain_level
    ].freeze

  def category
    @category ||= if rule_type == 'by_category'
      Category.find(rule_value)
    end
  end
  
  def test_level
    if rule_type == 'by_success_passing_all_tests_of_certain_level'
      rule_value
    end
  end
end
