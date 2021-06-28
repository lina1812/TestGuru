class GettingBadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def call
    check_first_try_badge
    check_all_by_category_badge
    check_all_by_level_badge
  end

  private

  def check_first_try_badge
    badges = Badge.where(type: :by_success_passing_on_the_first_try)
    if badges.any? &&
       (@user.test_passages.where(test_id: @test.id).count == 1) &&
       @test_passage.successful?
      add_badges_to_user(badges)
    end
  end

  def check_all_by_category_badge
    badges = Badge.where(type: :by_category, category_id: @test.category_id)
    puts not_passed_test_in_category_count(@test.category_id)
    add_badges_to_user(badges) if badges.any? && (not_passed_test_in_category_count(@test.category_id) == 0)
  end

  def check_all_by_level_badge
    badges = Badge.where(type: :by_success_passing_all_tests_of_certain_level, test_level: @test.level)
    add_badges_to_user(badges) if badges.any? && (not_passed_test_by_level_count(@test.level) == 0)
  end

  def add_badges_to_user(badges)
    badges.each do |badge|
      ReceivedBadge.create(user_id: @user.id, badge_id: badge.id)
    end
  end

  def not_passed_test_in_category_count(category_id)
    count = 0
    success_test_passages_by_category = []
    @user.test_passages.joins(:test).where(tests: { category_id: category_id }).each do |test_passage|
      success_test_passages_by_category << test_passage.test if test_passage.successful?
    end
    Test.where(category_id: category_id).each do |test|
      count += 1 unless success_test_passages_by_category.include?(test)
    end
    count
  end

  def not_passed_test_by_level_count(level)
    count = 0
    success_test_passages_by_level = []
    @user.test_passages.joins(:test).where(tests: { level: level }).each do |test_passage|
      success_test_passages_by_level << test_passage.test if test_passage.successful?
    end
    Test.where(level: level).each do |test|
      count += 1 unless success_test_passages_by_level.include?(test)
    end
    count
  end
end
