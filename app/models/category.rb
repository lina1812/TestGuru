class Category < ApplicationRecord
  default_scope { order(:title) }

  has_many :tests, dependent: :restrict_with_exception

  validates :title, presence: true
end
