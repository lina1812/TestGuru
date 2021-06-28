class Badge < ApplicationRecord
  self.inheritance_column = :_type_disabled

  has_many :received_badge
  has_many :users, through: :received_badge
  belongs_to :category, optional: true

  TYPES = %i[
    by_category
    by_success_passing_on_the_first_try
    by_success_passing_all_tests_of_certain_level
  ].freeze
end
