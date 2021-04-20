require 'digest/sha1'

class User < ApplicationRecord
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :author_tests, class_name: 'Test', inverse_of: :author, foreign_key: :author_id, dependent: :nullify

  EMAIL_REGEXP = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/i.freeze
  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: EMAIL_REGEXP, message: 'please enter email in correct format' }

  has_secure_password

  def tests_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
