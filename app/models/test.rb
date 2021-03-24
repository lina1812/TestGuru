class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', inverse_of: :author_tests, optional: true

  has_many :passed_tests, dependent: :destroy
  has_many :users, through: :passed_tests
  has_many :questions, dependent: :destroy

  validates :title, presence: true,
                    uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than: 0 }

  LIGHT_LEVEL = (0..1).freeze
  MEDIUM_LEVEL = (2..4).freeze
  HIGHT_LEVEL = (5..Float::INFINITY).freeze

  scope :tests_by_level, ->(range) { where(level: range) }

  scope :light_tests, -> { tests_by_level(LIGHT_LEVEL) }
  scope :medium_tests, -> { tests_by_level(MEDIUM_LEVEL) }
  scope :hight_tests, -> { tests_by_level(HIGHT_LEVEL) }

  scope :by_category, ->(category_name) { joins(:category).where(categories: { title: category_name }) }

  def self.titles_by_category(category_name)
    by_category(category_name).order(title: :desc).pluck(:title)
  end
end
