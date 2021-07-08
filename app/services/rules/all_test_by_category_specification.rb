class Rules::AllTestByCategorySpecification < Rules::AbstractRuleSpecification
  
  
  def satisfies?
    not_passed_test_in_category_count(@rule_value, @test_passage) == 0
  end
  
  
  private
  
  def not_passed_test_in_category_count(rule_value, test_passage)
    
    count = 0
    success_test_passages_by_category = []
    
  
    @test_passage.user.test_passages.joins(:test).where(tests: { category_id: @rule_value }).each do |test_passage|
      success_test_passages_by_category << test_passage.test if test_passage.win
    end


    Test.where(category_id: @rule_value).each do |test|
      count += 1 unless success_test_passages_by_category.include?(test)
    end
    count
  end
    
    
end