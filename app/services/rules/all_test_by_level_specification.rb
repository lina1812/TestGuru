class Rules::AllTestByLevelSpecification < Rules::AbstractRuleSpecification
  
  
  def satisfies?
    not_passed_test_by_level_count(@rule_value, @test_passage) == 0
  end
  
  
  private
  
  def not_passed_test_by_level_count(rule_value, test_passage)
    
    count = 0
    success_test_passages_by_level = []
    
  
    @test_passage.user.test_passages.joins(:test).where(tests: { level: @rule_value }).each do |test_passage|
      success_test_passages_by_level << test_passage.test if test_passage.win
    end


    Test.where(level: @rule_value).each do |test|
      count += 1 unless success_test_passages_by_level.include?(test)
    end
    count
  end
    
end
