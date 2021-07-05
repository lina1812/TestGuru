class Rules::PassingOnTheFirstTrySpecification < Rules::AbstractRuleSpecification
  
  
  def satisfies?
    (@test_passage.user.test_passages.where(test_id: @test_passage.test.id).count == 1) && (@test_passage.win = true)

  end
  
  
end