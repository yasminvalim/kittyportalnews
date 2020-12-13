class Post < ApplicationRecord
  validates :content, length: { minimum: 10 }
  validates :title, length: { minimum: 3 }
  belongs_to :user
  has_many :comments, dependent: :destroy
  paginates_per 5
end
