class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true

  scope :correct, -> { where(correct: true) }
  
  validate :validate_number
  
  private 
  
  def validate_number
    return unless new_record?
    errors.add(:number, "too much answers") unless Answer.where(question: question).count < 4
  end
end
