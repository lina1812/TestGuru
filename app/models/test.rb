class Test < ApplicationRecord
  # belongs_to :category

  def self.titles_by_category(category_name)
    category_id = Category.where('title = :title', title: category_name).first.id
    where('category_id = :id', id: category_id).order(title: :desc).pluck(:title)
  end
end
