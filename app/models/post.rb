class Post < ApplicationRecord
  validates :text, presence: true
  
  belongs_to :author, foreign_key: 'AuthorId', class_name: 'User'
  has_many :comments, foreign_key: 'post_id', dependent: :destroy
  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
end
