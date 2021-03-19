class User < ApplicationRecord
  has_many :passed_tests
  has_many :tests, through: :passed_tests
  def user_tests(test_level)
    tests.where(level: test_level)
  end
end
