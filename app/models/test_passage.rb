class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_set_next_question, on: :update

  SUCCESS_RATIO = 85

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def completed?
    current_question.nil?
  end

  def successful?
    counting_result >= SUCCESS_RATIO
  end

  def counting_result
    (correct_questions / test.questions.size.to_f) * 100
  end
  
  def timer_out?
    test.timer.present? && (created_at + test.timer*60 - Time.now) < 0
  end

  private

  def correct_answer?(answer_ids)
    return false if answer_ids.nil?

    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def before_validation_set_next_question
    self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first if current_question
  end
end
