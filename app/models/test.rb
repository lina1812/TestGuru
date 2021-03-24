class Test < ApplicationRecord
  
  belongs_to :category
  belongs_to :author, class_name: 'User', inverse_of: :author_tests
  
  has_many :passed_tests, dependent: :destroy
  has_many :users, through: :passed_tests
  has_many :questions, dependent: :restrict_with_exception
  
  def self.titles_by_category(category_name)
    
    Test.joins(:categories)
        .where('categories.title = :category_name', category_name: category_name)
        .order(title: :desc)
        .pluck(:title)
  
  end
  
end
