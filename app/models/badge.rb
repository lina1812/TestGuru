class Badge < ApplicationRecord
  self.inheritance_column = :_type_disabled
  
  has_many :receive_badges
  has_many :users, through: :receive_badges
  belongs_to :category, optional: true
  
  TYPES = [
          :by_category,
          :by_success_passing_on_the_first_try,
          :by_success_passing_all_tests_of_certain_level
            ]
end
