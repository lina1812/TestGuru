class Test < ApplicationRecord
  belongs_to :cateriory
  has_many :questions
end
