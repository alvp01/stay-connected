class Comment < ApplicationRecord
  validates :text, presence: true

  belongs_to :author, foreign_key: 'AuthorId', class_name: 'User'
  belongs_to :post, foreign_key: 'post_id'
end
