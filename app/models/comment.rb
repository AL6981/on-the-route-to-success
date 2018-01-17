class Comment < ApplicationRecord
  validates :comment, presence: true, length: {minimum: 50, message: 'Must be at least 50 characters long!'}
  belongs_to :question
end
