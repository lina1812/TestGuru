class User < ApplicationRecord
  # has_many :passed_tests
  # has_many :tests, through: :passed_tests
  def user_tests(test_level)
    passed_tests_ids = PassedTest.where(user: self).pluck('test_id')
    Test.where('id IN (:id) AND level = :level', id: passed_tests_ids, level: test_level)
  end
end
