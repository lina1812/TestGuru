class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', inverse_of: :author_tests, optional: true

  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  has_many :questions, dependent: :destroy

  validates :title, presence: true,
                    uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than: 0 }

  scope :easy, -> { where(level: (0..1)) }
  scope :medium, -> { where(level: (2..4)) }
  scope :difficult, -> { where(level: (5..Float::INFINITY)) }

  scope :by_category, ->(category_name) { joins(:category).where(categories: { title: category_name }) }

  def self.titles_by_category(category_name)
    by_category(category_name).order(title: :desc).pluck(:title)
  end
end
