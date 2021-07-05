class GettingBadgeService
  
  RULES = {
    by_category: Rules::AllTestByCategorySpecification,
    by_success_passing_on_the_first_try: Rules::PassingOnTheFirstTrySpecification,
    by_success_passing_all_tests_of_certain_level: Rules::AllTestByLevelSpecification
  }.freeze
  
  def initialize(test_passage)
    @test_passage = test_passage
  end

  def call
    Badge.find_each do |badge|
      rule = RULES[badge.rule_type.to_sym].new(rule_value: badge.rule_value, test_passage: @test_passage)
      add_badge(badge) if rule.satisfies?
    end
  end

  private

  def add_badge(badge)
    ReceivedBadge.create(user_id: @test_passage.user.id, badge_id: badge.id)
  end
end
