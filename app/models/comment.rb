class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :content, length: { minimum: 5 }
  paginates_per 3
end
