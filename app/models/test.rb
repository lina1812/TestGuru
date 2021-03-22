class Test < ApplicationRecord
  has_many :passed_tests
  has_many :users, through: :passed_tests
  has_many :questions
  belongs_to :category
  belongs_to :author, class_name: 'User'
  def self.titles_by_category(category_name)
    Test.joins('JOIN categories ON tests.category_id = categories.id ')
        .where('categories.title = :category_name', category_name: category_name)
        .order(title: :desc)
        .pluck(:title)
  end
end
