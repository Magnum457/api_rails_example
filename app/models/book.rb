class Book < ApplicationRecord
  belongs_to :category
  validates :title, :author, presence: true
  validates :title, length: { minimum: 3 }
end
