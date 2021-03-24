class User < ApplicationRecord
  
  has_many :passed_tests, dependent: :destroy
  has_many :tests, through: :passed_tests
  has_many :author_tests, class_name: 'Test', inverse_of: :author, foreign_key: 'author_id'
  
  def user_tests(test_level)
    Test.joins(:passed_tests)
        .where('passed_tests.user_id = :user_id', user_id: id)
        .where('tests.level = :level', level: test_level)
  end
  
end
