class User < ApplicationRecord
  def user_tests(test_level)
    Test.joins('JOIN passed_tests on tests.id = passed_tests.test_id')
        .where('passed_tests.user_id = :user_id', user_id: id)
        .where('tests.level = :level', level: test_level)
  end
end
