class Question < ApplicationRecord
  belongs_to :test, counter_cache: true

  has_many :answers, dependent: :destroy
  has_many :test_passages, dependent: :nullify, foreign_key: :current_question_id

  validates :body, presence: true

  def number
    test.questions.order(:id).where('id <= ?', id).count
  end
end
